#include <stdio.h>

__global__ void who_am_i(){
	//printf("I am thread %d\n", threadIdx.x);
	//printf("block %d, thread %d\n", blockIdx.x, threadIdx.x);
	printf("block %d, thread %d, global id = %d\n", 
	       blockIdx.x, threadIdx.x, 
	       blockIdx.x * blockDim.x + threadIdx.x);
}

int main(){
	who_am_i<<<1, 64>>>();// to define blocks and threads
	cudaDeviceSynchronize();
	return 0;
}

//output

/*

*/
