#include <stdio.h>

int main() {
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, 0);
    
    printf("GPU: %s\n", prop.name);
    printf("VRAM: %d MB\n", prop.totalGlobalMem / 1024 / 1024);
    printf("SM count: %d\n", prop.multiProcessorCount);
    printf("Max threads per SM: %d\n", prop.maxThreadsPerMultiProcessor);
    printf("Max threads per block: %d\n", prop.maxThreadsPerBlock);
    printf("Warp size: %d\n", prop.warpSize);
    printf("Shared memory per block: %d KB\n", prop.sharedMemPerBlock / 1024);
    printf("L2 cache: %d MB\n", prop.l2CacheSize / 1024 / 1024);
    
    return 0;
}
