#include <stdio.h>

__global__ void who_am_i(){
	//printf("I am thread %d\n", threadIdx.x);
	//printf("block %d, thread %d\n", blockIdx.x, threadIdx.x);
	printf("block %d, thread %d, global id = %d\n", 
	       blockIdx.x, threadIdx.x, 
	       blockIdx.x * blockDim.x + threadIdx.x);
}

int main(){
	who_am_i<<<1, 16>>>();// to define blocks and threads
	cudaDeviceSynchronize();
	return 0;
}

//output

/*
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

16 threads ran on 1 block , now lets try 32
*/
