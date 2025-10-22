# 2. Create two (3 * 3) matrices using NumPy and print it. Perform and print the results of the following linear algebra operations
# a. Matrix addition
# b. Matrix subtraction
# c. Matrix multiplication (element-wise and dot product)
# d. Transpose of a matrix
# e. Determinant and inverse (if applicable)

import numpy as np

mat1 = np.random.randint(1, 10, (3, 3))
mat2 = np.random.randint(1, 10, (3, 3))

print('Matrix 1:\n', mat1)
print('Matrix 2:\n', mat2)

print('Matrix addition:\n', mat1 + mat2)
print('Matrix subtraction:\n', mat1 - mat2)
print('Element-wise multiplication:\n', mat1 * mat2)

print('Dot product:\n', np.dot(mat1, mat2))
print('Transpose of matrix 1:\n', mat1.T)
print('Transpose of matrix 2:\n', mat2.T)

print('Determinant of matrix 1:\n', np.linalg.det(mat1))
print('Determinant of matrix 2:\n', np.linalg.det(mat2))

if (np.linalg.det(mat1) != 0):
    print('Inverse of matrix 1:', np.linalg.inv(mat1))
else:
    print('Inverse of matrix 1 does not exist')

if (np.linalg.det(mat2) != 0):
    print('Inverse of matrix 2:', np.linalg.inv(mat2))
else:
    print('Inverse of matrix 2 does not exist')

