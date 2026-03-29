// here we multiplying big matrix but optimising it using blocking , i.e cutting it to fit into cache

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 4096
#define BLOCK 64

float A[N][N];
float B[N][N];
float C[N][N];

int main() {
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++) {
            A[i][j] = 1.0f;
            B[i][j] = 1.0f;
        }

    clock_t start = clock();

    for (int i = 0; i < N; i++)
        for (int k = 0; k < N; k++)
            for (int j = 0; j < N; j++)
                C[i][j] += A[i][k] * B[k][j];

    clock_t end = clock();

    printf("N = %d, time = %.2f ms\n", N,
           1000.0 * (end - start) / CLOCKS_PER_SEC);

    return 0;
}
