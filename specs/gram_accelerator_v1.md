# Gram Matrix Accelerator Design Spec V1

## Purpose

The purpose of this project is to implement an FPGA based calculator, which computes the Gram matrix of an input matrix:

G = M * (M^T)

M is a binary matrix that maps to Hadamard Matrix Candidates with the following mapping:

1 -> +1
0 -> -1

For V1, the accelerator does the minimum number of dot product computations. This product takes advantage of that fact that binary vectors can be computed using the bitwise xor of 2 vectors. The dot product is computed by finding:

hamming distance = bitsum(xor(a,b))

dot product = Order - 2*(hamming distance)

## Scope

Functions:

-Accepts a binary square matrix
-Return Gram Matrix
-Use hamming distance to compute the dot product for the triangle above a diagonal
-mirror that triangle over the diagonal & replace diagonal with order
-the priority for this iteration is correctness. Future iterations will improve the speed

Out of Scope:

-Parallel processing
-FSMD control
-Any sort of AXI
-Hadamard Constuction stuff

## Data Representation

The matrix will be stored as a vector. If the matrix is an N x N matrix, the vector will be N^2 positions long. 

Each position will be a 1 or a 0. After N positions, you will be in the same column in the next row.

They will map to hadamard vector in the following way.

1 -> +1
0 -> -1

for example:

[1, 0, 0, 1]

[1, -1]
[-1, 1]

I will also output the full gram matrix as the vector of length N^2

