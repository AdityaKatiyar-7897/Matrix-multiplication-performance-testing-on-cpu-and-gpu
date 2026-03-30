#include <stdio.h>

int main() {
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, 0);
    
    printf("GPU: %s\n", prop.name); //rtx 3060
    printf("VRAM: %d MB\n", prop.totalGlobalMem / 1024 / 1024); //12287 MB of vram
    printf("SM count: %d\n", prop.multiProcessorCount); // 28 Streaming Multiprocessor , which is like cpu cores but with hunderds of smaller execution unit inside it
    printf("Max threads per SM: %d\n", prop.maxThreadsPerMultiProcessor);// Each SM can handle 1536 threads , ie 28 x 1536 = 43008 threads simultaneously
    printf("Max threads per block: %d\n", prop.maxThreadsPerBlock);// one block can have 1024 threads not more than that
    printf("Warp size: %d\n", prop.warpSize);// 32 threads in 1 warp physically locked together , all take step same time
    printf("Shared memory per block: %d KB\n", prop.sharedMemPerBlock / 1024);//48 kb fast manual cache
    printf("L2 cache: %d MB\n", prop.l2CacheSize / 1024 / 1024); //automatic shared cache across all SMs , like cpu's L3 cache but for GPU
    
    return 0;
}

// COMPLETE PICTURE OF THE GPU IS AS FOLLOWS

//RTX 3060

//--28 SM
//   --Each SM runs upto 1536 threads
//   --Threads are grouped into warps of 32
//   --48 kb shared memory
//   --own L1 cache

//--2MB L2 cache
//--12GB VRAM
