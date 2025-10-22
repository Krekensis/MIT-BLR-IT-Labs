# 1. Generate a 3x4 NumPy array with random integers between 1 and 50.
# a. Calculate and print the Mean, Median, and Standard Deviation of the array
# b. Print the Sum of all elements and the sum of each row.
# c. Reshape the 3x4 array into a 2x6 array and print it.

import numpy as np

arr = np.random.randint(1, 50, (3, 4))
print('Array:', arr)

print('Mean:', np.mean(arr))
print('Median:', np.median(arr))
print('Standard deviation:', np.std(arr))

print('Sum of all elements:', np.sum(arr))
print('Sum of each row:', np.sum(arr, axis=1))

print('Reshaped array:', arr.reshape(2, 6))