# Create a null vector of size 10  
# Create a null vector of size 10 but the fifth value which is 1  
# Create a vector with values ranging from 100 to 490  
# Reverse a vector (first element becomes last)  
# Create a 3x3 matrix with values ranging from 0 to 8  
# Create a 3x3 identity matrix  
# Create a 3x3x3 array with random values  
# Create a 10x10 array with random values and find the minimum and maximum values  

import numpy as np
#1
a = np.zeros(10)
print(a)

#2
a[4] = 1
print(a)

#3
b = np.random.randint(100, 490, 10)
print(b)

#4
rev = np.flip(b)
print(rev)

#5
matrix = np.arange(9).reshape(3, 3)
print(matrix)

#6
i = np.eye(3)
print(i)

#7
d = np.random.randint(1, 100, (3, 3, 3))
print(d)

#8
x = np.random.randint((10, 10))
print(x)
xmin, xmax = x.min(), x.max()
print("Minimum and Maximum Values: ")
print(xmin, xmax)
