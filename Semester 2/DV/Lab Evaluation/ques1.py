# Create a 2-dimensional ndarray with seven rows and five columns in which each entry is equal to one. Assign it to a variable x.

import numpy as np

x = np.ones((7, 5))
print(x)

# Print the following pattern
# Write a Python code to print the following number pattern using a loop.
 
# 1
# 1 2
# 1 2 3
# 1 2 3 4
# 1 2 3 4 5

for i in range(5):
    for j in range(i+1):
        print(j+1, end=' ')
    print()

# Create a 1-dimensional ndarray containing all integers from 0 to 100 (inclusive). Assign the result to variable int_0_to_100.

int_0_to_100 = np.arange(101)
print(int_0_to_100)

# Write a Python program to accept a number from a user and calculate the sum of all numbers from 1 to a given number
# For example, if the user entered 10, the output should be 55 (1+2+3+4+5+6+7+8+9+10)

num = int(input('Enter a number: '))
print(f'Sum of numbers from 1 to {num}:', sum(range(num+1)))
 
# Create a 5X2 integer array from a range between 100 to 200 such that the difference between each element is 10

arr = np.arange(100, 200, 10).reshape(5, 2)
print(arr)