#include <stdio.h>

__global__ void who_am_i(){
	//printf("I am thread %d\n", threadIdx.x);
	//printf("block %d, thread %d\n", blockIdx.x, threadIdx.x);
	printf("block %d, thread %d, global id = %d\n", 
	       blockIdx.x, threadIdx.x, 
	       blockIdx.x * blockDim.x + threadIdx.x);
}

int main(){
//	who_am_i<<<1, 33>>>();// to define blocks and threads
	who_am_i<<<1, 43>>>();
//	who_am_i<<<1, 33>>>();
//	who_am_i<<<1, 33>>>();
//	who_am_i<<<1, 33>>>();
//	who_am_i<<<1, 33>>>();
	cudaDeviceSynchronize();
	return 0;
}

//output

/*
block 0, thread 32, global id = 32
block 0, thread 33, global id = 33
block 0, thread 34, global id = 34
block 0, thread 35, global id = 35
block 0, thread 36, global id = 36
block 0, thread 37, global id = 37
block 0, thread 38, global id = 38
block 0, thread 39, global id = 39
block 0, thread 40, global id = 40
block 0, thread 41, global id = 41
block 0, thread 42, global id = 42
block 0, thread 0, global id = 0
block 0, thread 1, global id = 1
block 0, thread 2, global id = 2
block 0, thread 3, global id = 3
block 0, thread 4, global id = 4
block 0, thread 5, global id = 5
block 0, thread 6, global id = 6
block 0, thread 7, global id = 7
block 0, thread 8, global id = 8
block 0, thread 9, global id = 9
block 0, thread 10, global id = 10
block 0, thread 11, global id = 11
block 0, thread 12, global id = 12
block 0, thread 13, global id = 13
block 0, thread 14, global id = 14
block 0, thread 15, global id = 15
block 0, thread 16, global id = 16
block 0, thread 17, global id = 17
block 0, thread 18, global id = 18
block 0, thread 19, global id = 19
block 0, thread 20, global id = 20
block 0, thread 21, global id = 21
block 0, thread 22, global id = 22
block 0, thread 23, global id = 23
block 0, thread 24, global id = 24
block 0, thread 25, global id = 25
block 0, thread 26, global id = 26
block 0, thread 27, global id = 27
block 0, thread 28, global id = 28
block 0, thread 29, global id = 29
block 0, thread 30, global id = 30
block 0, thread 31, global id = 31
*/
