#include <stdio.h>

#define N 8

__global__ void shared_demo(int *arr){
	__shared__ int s_arr[N]; // this one create the shared pool of memory

	int id = threadIdx.x;

	s_arr[id] = arr[id];
	__syncthreads(); // this one ensures that the thread wait if the data is not loaded yet , support thread 3 is trying to access values that thread 5 is going to pour but its not yet there so you might get a garbage value , this is a way where you stop it before the value is really there , thats basically what syncing really as the name suggests

	printf("thread %d reads %d from shared memory\n", id, s_arr[id]);
} 

int main(){
	int size = N * sizeof(int);

	int h_arr[N] = {10,20,30,40,50,60,70,80}; // these are the 8 numbers on cpu

	int *d_arr;
	cudaMalloc(&d_arr, size);
	cudaMemcpy(d_arr, h_arr, size, cudaMemcpyHostToDevice); //copying it to vram

	shared_demo<<<1, N>>>(d_arr);
	cudaDeviceSynchronize();

	cudaFree(d_arr);
	return 0;
}

/* 
output:->

thread 0 reads 10 from shared memory
thread 1 reads 20 from shared memory
thread 2 reads 30 from shared memory
thread 3 reads 40 from shared memory
thread 4 reads 50 from shared memory
thread 5 reads 60 from shared memory
thread 6 reads 70 from shared memory
thread 7 reads 80 from shared memory

*/
