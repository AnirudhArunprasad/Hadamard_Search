# gram_accelerator_test.py

from gram_accelerator_functional import gram_accelerator
import numpy as np

# testing several matricies of order 4*k
for k in range(1,21):
  #generate 100 random matricies
  for _ in range(100):
    order = 4*k

    A_binary = np.random.randint(0,2,(order,order))

    #convert the binary encoding to one with just ones and zeroes
    A = np.where(A_binary == 1, 1, -1)

    expected = A @ (A.T)

    actual = gram_accelerator(A_binary)[2]

    assert np.array_equal(expected,actual)

print("All Tests Passed")
