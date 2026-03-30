/*

Here is the program to double every number of an array , normally we do using cpu but lets try gpu

On CPU its like for array of 10 numbers
:
  for (int i = 0 ; i < 10 ; i++)
      arr[i] = arr[i] * 2 ;

but for GPU its different */

#include <stdio.h>

#define N 10

__global__ void double_it(int *arr){
	int id = blockIdx.x * blockDim.x + threadIdx.x;
	arr[id] = arr[id] * 2;
}

int main(){
	int size = N * sizeof(int);
	int h_arr[10] = {1,2,3,4,5,6,7,8,9,10}; // this is normal C array that lives in cpu ram

	int *d_arr; // its a pointer and right now its pointing to nothing 
	cudaMalloc(&d_arr, size); // this one reserves 40 bytes and stores the address of reserved space into d_arr

    // Now its time to copy data from our cpu ram to gpu vram

    cudaMemcpy(d_arr, h_arr, size, cudaMemcpyHostToDevice);
    /*This does 4 things
    - d_arr is where to put it in gpu memory
    -h_arr is where to talke from (cpu memory)
    -size , how many bytes to copy
    -cudaMemcpyHostToDevice , direction of copying (CPU -> GPU)*/


    //Now the data is ready on the GPU to be worked on

    double_it<<<1, N>>>(d_arr); // here 1 block and N threads i.e 10 ,and we are passing d_arr so kernal know where to find the array
    cudaDeviceSynchronize(); // this makes CPU wait until GPU is done with one task

    //Now its time to give the values back to cpu to print it to console 
    cudaMemcpy(h_arr, d_arr, size, cudaMemcpyDeviceToHost);

    for (int i = 0; i< N; i++)
        printf("%d ", h_arr[i]);
    printf("\n");

    cudaFree(d_arr);
    return 0;
}
