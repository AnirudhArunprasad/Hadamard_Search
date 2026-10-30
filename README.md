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

# 10/17/26

Today, I'm thinking that I start working on the python golden model for the overall flow. As of today, the current architecture I was initially thinking of splitting the search into mutually orthogonal vector searches. The problem is that you can have a large set of orthogonal vectors, and they may not have a constructible Hadamard solution. I was initially thinking of chunking all the vectors into blocks of 4, and precomputing all possible interactions in ROM, and then trying to find additions of interaction vectors which would have an appropriate hamming distance. The unfortunate thing is that there is a possibility for backtracking, which makes me no longer confident that this is the best approach. I will attempt to find a better one before creating the golden model, but I don't mind building a worse prototype before a better one after some iterations.

#10/30/26
I'm back to the project after quite a long hiatus for exams. I'm going to start by making a clear golden model and constructing a spec so that I have direction for the next few months. The initial plan is to start learning while building the verification framework. I did not end up actually working on the golden model back on 10/17. The verification framework is as follows:

For any matrix: M, if M*M^T is a diagonal matrix, M must be an orthogonal basis. If M*M^T, = I, then M is orthonormal. Sitting right in the middle, if M*M^T = nI where n is the order (row and collumn size) of M, (and if M is constructed of purely 1 and -1), then M must be hadamard.

We can take advantage of these properties to verify that a matrix is in fact Hadamard. 

Thus, the first project I will be undertaking is to construct a Gram matrix accelerator. It's job is to compute M*M^T as fast as is possible. The job for this week is to work on the python golden model and spec for the accelerator, and in later weeks, I will translate that spec into sv. I'm going to pivot to sv from pure Verilog, since sv is the industry standard.
