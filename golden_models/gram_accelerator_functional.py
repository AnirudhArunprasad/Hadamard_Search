#gram_accelerator_functional.py

import numpy as np

"""
A will be passed in as a definitively square matrix of ones and zeroes.

This maps to hadamard as such:
1 -> 1
0 -> -1

using a pivot, we find only the calculations on one triangle, and then mirror them to the other triangle.

gram_accelerator will return: [int: error code, string: "message", int/matrix: gram matrix or fill]
"""
def gram_accelerator(A):

  rows,cols = A.shape

  if (rows != cols):
    return [-1, "A Not Square", -1]

  if not np.all((A == 0) | (A == 1)):
    return [-1, "Not a binary matrix", -1]

  gram = np.zeros((rows,cols), dtype=int)

  #The row below which we are computing the triangle
  for pivot in range(rows):

    #every row dotted with self is just rows:
    gram[pivot,pivot] = rows

    #every value below uses hamming
    for j in range(pivot+1,rows):
      #sum of xor of binary vector = hamming distance
      xor = A[pivot] ^ A[j]
      d = np.sum(xor)
      #update gram with computed dot products
      dot = rows - (2*d)
      gram[pivot,j] = dot
      gram[j,pivot] = dot

  return [1, "success", gram]

if __name__ == "__main__":
  A = np.array([[1,0], [1,1]])

  gram = gram_accelerator(A)
  print(gram[0])
  print(gram[1])
  print(gram[2])
