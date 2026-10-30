# gram_accelerator_truth.py
import numpy as np

def gram_truth(A):
  rowsA, colsA = A.shape

  if (rowsA != colsA):
    return [-1, "A not Square", -1]
  
  gram = A @ (A.T)

  return [1, "Success", gram]


A = np.array([[1, 1], [1, -1]])

gram = gram_truth(A)
print(gram[0])
print(gram[1])
print(gram[2])