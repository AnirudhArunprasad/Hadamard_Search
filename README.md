# Hadamard Search

This project is still in progress. The latest updates are recorded below:

A project optimizing the search for special Matrices called Hadamard Matrices using FPGAs

# 10/14/26

Today, using Apio sim: [Repo for Virtual Apio Toolchain](https://github.com/DougTownsend/apio/tree/main), I'm going to write the Verilog to check if 2 Hadamard vectors are orthogonal.

Since hadamard vectors are only +- 1, H1 * H2 = 0 is an equivalent statment to thier hamming distance being dim/2

In other words, for 2 Hadamard vectors to be orthogonal, exactly 1/2 of their entries should be the same, and 1/2 should be opposite. we can use 1 for + and 0 for - in a binary string.
Therefore, if H1 xor H2 = 1/2 of the dimension of H1 and H2, then exactly half of the entries are different, and the dot product must be 0.

This makes the actual Verilog very simple.

# 10/15/26

I cleaned up some more of the basic hamming distance calculations today, but the general idea is starting to take shape.

It's clear that there is something quite intrinsic and fundamental about the value 4 when it comes to Hadamard matricies, so the goal is going to be to "chunk" each vector by seperating it into blocks of 4. Those blocks can then be tested against the other vectors, and that can power a minimization or optimization function, while the actual comparisons can be constant lookup stored in ROM, or Flash. (I haven't fully worked out the architecture yet)
