# Write a Python code block to create a tuple with five elements. 
# Try to change one of the elements and handle the error that occurs. 
# Print a message that explains why the error occurred.

t = (1, 2, 3, 4, 5)
try:
    t[0] = 10
except TypeError as e:
    print('Error:', e)
    print('Tuples are immutable')

