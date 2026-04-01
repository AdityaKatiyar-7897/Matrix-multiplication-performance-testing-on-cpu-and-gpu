#include <stdio.h>
#include <time.h>

#define N 4096
#define BLOCK 16

/*__global__ void matmul(float *A, float *B, float *C, int n) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < n && col < n) {
        float sum = 0.0f;
        for (int k = 0; k < n; k++)
            sum += A[row * n + k] * B[k * n + col];
        C[row * n + col] = sum;
    }
}*/

__global__ void matmul(float *A, float *B, float *C, int n) {
    __shared__ float s_A[BLOCK][BLOCK];
    __shared__ float s_B[BLOCK][BLOCK];

    int row = blockIdx.y * BLOCK + threadIdx.y;
    int col = blockIdx.x * BLOCK + threadIdx.x;
    float sum = 0.0f;

    for (int t = 0; t < n / BLOCK; t++) {
        s_A[threadIdx.y][threadIdx.x] = A[row * n + t * BLOCK + threadIdx.x];
        s_B[threadIdx.y][threadIdx.x] = B[(t * BLOCK + threadIdx.y) * n + col];
        __syncthreads();

        for (int k = 0; k < BLOCK; k++)
            sum += s_A[threadIdx.y][k] * s_B[k][threadIdx.x];
        __syncthreads();
    }

    C[row * n + col] = sum;
}

int main() {
    int size = N * N * sizeof(float);

    float *h_A = (float*)malloc(size);
    float *h_B = (float*)malloc(size);
    float *h_C = (float*)malloc(size);

    for (int i = 0; i < N * N; i++) {
        h_A[i] = 1.0f;
        h_B[i] = 1.0f;
    }

    float *d_A, *d_B, *d_C;
    cudaMalloc(&d_A, size);
    cudaMalloc(&d_B, size);
    cudaMalloc(&d_C, size);

    cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice);

    dim3 threads(BLOCK, BLOCK);
    dim3 blocks(N / BLOCK, N / BLOCK);

    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);

    cudaEventRecord(start);
    matmul<<<blocks, threads>>>(d_A, d_B, d_C, N);
    cudaEventRecord(stop);
    cudaEventSynchronize(stop);

    float ms = 0;
    cudaEventElapsedTime(&ms, start, stop);

    printf("GPU naive: %.2f ms\n", ms);

    free(h_A); free(h_B); free(h_C);
    cudaFree(d_A); cudaFree(d_B); cudaFree(d_C);

    return 0;
}
