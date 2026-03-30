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
//	who_am_i<<<1, 43>>>();
//	who_am_i<<<1, 68>>>();
	who_am_i<<<1, 200>>>();
//	who_am_i<<<1, 33>>>();
//	who_am_i<<<1, 33>>>();
	cudaDeviceSynchronize();
	return 0;
}

//output

/*
block 0, thread 192, global id = 192
block 0, thread 193, global id = 193
block 0, thread 194, global id = 194
block 0, thread 195, global id = 195
block 0, thread 196, global id = 196
block 0, thread 197, global id = 197
block 0, thread 198, global id = 198
block 0, thread 199, global id = 199
block 0, thread 96, global id = 96
block 0, thread 97, global id = 97
block 0, thread 98, global id = 98
block 0, thread 99, global id = 99
block 0, thread 100, global id = 100
block 0, thread 101, global id = 101
block 0, thread 102, global id = 102
block 0, thread 103, global id = 103
block 0, thread 104, global id = 104
block 0, thread 105, global id = 105
block 0, thread 106, global id = 106
block 0, thread 107, global id = 107
block 0, thread 108, global id = 108
block 0, thread 109, global id = 109
block 0, thread 110, global id = 110
block 0, thread 111, global id = 111
block 0, thread 112, global id = 112
block 0, thread 113, global id = 113
block 0, thread 114, global id = 114
block 0, thread 115, global id = 115
block 0, thread 116, global id = 116
block 0, thread 117, global id = 117
block 0, thread 118, global id = 118
block 0, thread 119, global id = 119
block 0, thread 120, global id = 120
block 0, thread 121, global id = 121
block 0, thread 122, global id = 122
block 0, thread 123, global id = 123
block 0, thread 124, global id = 124
block 0, thread 125, global id = 125
block 0, thread 126, global id = 126
block 0, thread 127, global id = 127
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
block 0, thread 64, global id = 64
block 0, thread 65, global id = 65
block 0, thread 66, global id = 66
block 0, thread 67, global id = 67
block 0, thread 68, global id = 68
block 0, thread 69, global id = 69
block 0, thread 70, global id = 70
block 0, thread 71, global id = 71
block 0, thread 72, global id = 72
block 0, thread 73, global id = 73
block 0, thread 74, global id = 74
block 0, thread 75, global id = 75
block 0, thread 76, global id = 76
block 0, thread 77, global id = 77
block 0, thread 78, global id = 78
block 0, thread 79, global id = 79
block 0, thread 80, global id = 80
block 0, thread 81, global id = 81
block 0, thread 82, global id = 82
block 0, thread 83, global id = 83
block 0, thread 84, global id = 84
block 0, thread 85, global id = 85
block 0, thread 86, global id = 86
block 0, thread 87, global id = 87
block 0, thread 88, global id = 88
block 0, thread 89, global id = 89
block 0, thread 90, global id = 90
block 0, thread 91, global id = 91
block 0, thread 92, global id = 92
block 0, thread 93, global id = 93
block 0, thread 94, global id = 94
block 0, thread 95, global id = 95
block 0, thread 128, global id = 128
block 0, thread 129, global id = 129
block 0, thread 130, global id = 130
block 0, thread 131, global id = 131
block 0, thread 132, global id = 132
block 0, thread 133, global id = 133
block 0, thread 134, global id = 134
block 0, thread 135, global id = 135
block 0, thread 136, global id = 136
block 0, thread 137, global id = 137
block 0, thread 138, global id = 138
block 0, thread 139, global id = 139
block 0, thread 140, global id = 140
block 0, thread 141, global id = 141
block 0, thread 142, global id = 142
block 0, thread 143, global id = 143
block 0, thread 144, global id = 144
block 0, thread 145, global id = 145
block 0, thread 146, global id = 146
block 0, thread 147, global id = 147
block 0, thread 148, global id = 148
block 0, thread 149, global id = 149
block 0, thread 150, global id = 150
block 0, thread 151, global id = 151
block 0, thread 152, global id = 152
block 0, thread 153, global id = 153
block 0, thread 154, global id = 154
block 0, thread 155, global id = 155
block 0, thread 156, global id = 156
block 0, thread 157, global id = 157
block 0, thread 158, global id = 158
block 0, thread 159, global id = 159
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
block 0, thread 43, global id = 43
block 0, thread 44, global id = 44
block 0, thread 45, global id = 45
block 0, thread 46, global id = 46
block 0, thread 47, global id = 47
block 0, thread 48, global id = 48
block 0, thread 49, global id = 49
block 0, thread 50, global id = 50
block 0, thread 51, global id = 51
block 0, thread 52, global id = 52
block 0, thread 53, global id = 53
block 0, thread 54, global id = 54
block 0, thread 55, global id = 55
block 0, thread 56, global id = 56
block 0, thread 57, global id = 57
block 0, thread 58, global id = 58
block 0, thread 59, global id = 59
block 0, thread 60, global id = 60
block 0, thread 61, global id = 61
block 0, thread 62, global id = 62
block 0, thread 63, global id = 63
block 0, thread 160, global id = 160
block 0, thread 161, global id = 161
block 0, thread 162, global id = 162
block 0, thread 163, global id = 163
block 0, thread 164, global id = 164
block 0, thread 165, global id = 165
block 0, thread 166, global id = 166
block 0, thread 167, global id = 167
block 0, thread 168, global id = 168
block 0, thread 169, global id = 169
block 0, thread 170, global id = 170
block 0, thread 171, global id = 171
block 0, thread 172, global id = 172
block 0, thread 173, global id = 173
block 0, thread 174, global id = 174
block 0, thread 175, global id = 175
block 0, thread 176, global id = 176
block 0, thread 177, global id = 177
block 0, thread 178, global id = 178
block 0, thread 179, global id = 179
block 0, thread 180, global id = 180
block 0, thread 181, global id = 181
block 0, thread 182, global id = 182
block 0, thread 183, global id = 183
block 0, thread 184, global id = 184
block 0, thread 185, global id = 185
block 0, thread 186, global id = 186
block 0, thread 187, global id = 187
block 0, thread 188, global id = 188
block 0, thread 189, global id = 189
block 0, thread 190, global id = 190
block 0, thread 191, global id = 191
*/
