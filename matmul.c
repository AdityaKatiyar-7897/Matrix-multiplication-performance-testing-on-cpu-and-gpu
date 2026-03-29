// here we multiplying big matrix but using all the cores of our cpu

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

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

   double start = omp_get_wtime();
           
           #pragma omp parallel for
           for (int ii = 0; ii < N; ii += BLOCK)
               for (int kk = 0; kk < N; kk += BLOCK)
                   for (int jj = 0; jj < N; jj += BLOCK)
                       for (int i = ii; i < ii + BLOCK; i++)
                           for (int k = kk; k < kk + BLOCK; k++)
                               for (int j = jj; j < jj + BLOCK; j++)
                                   C[i][j] += A[i][k] * B[k][j];
           
           double end = omp_get_wtime();
           
           printf("N = %d, time = %.2f ms\n", N, (end - start) * 1000.0);

    return 0;
}
