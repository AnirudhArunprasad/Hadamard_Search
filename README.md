# Hadamard Search

This project is still in progress. The latest updates are recorded below:

A project optimizing the search for special Matrices called Hadamard Matrices using FPGAs

# 10/14/26

Today, using Apio sim, I'm going to write the Verilog to check if 2 Hadamard vectors are orthogonal.

Since hadamard vectors are only +- 1, H1 * H2 = 0 is an equivalent statment to thier hamming distance being dim/2

In other words, for 2 Hadamard vectors to be orthogonal, exactly 1/2 of their entries should be the same, and 1/2 should be opposite. we can use 1 for + and 0 for - in a binary string.
Therefore, if H1 xor H2 = 1/2 of the dimension of H1 and H2, then exactly half of the entries are different, and the dot product must be 0.

This makes the actual Verilog very simple.

