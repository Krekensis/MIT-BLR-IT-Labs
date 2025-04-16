# Write a Python code block to input numbers into two sets. 
# Perform union, intersection, and difference operations on the sets and print the results.

set1, set2 = set(), set()

n = int(input('Enter number of elements in set1: '))
for i in range(n):
    set1.add(int(input('Enter element: ')))

n = int(input('Enter number of elements in set2: '))
for i in range(n):
    set2.add(int(input('Enter element: ')))

print('Set1:', set1)
print('Set2:', set2)

print('Union:', set1.union(set2))
print('Intersection:', set1.intersection(set2))
print('Difference:', set1.difference(set2))
