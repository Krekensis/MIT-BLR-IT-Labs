# Write code to input numbers from the user and store them in a list.
# Find largest, smallest, sum, average of the numbers in the list.
# Count occurances of a number in the list.

list = []
n = int(input('Enter number of elements: '))

for i in range(n):
    list.append(int(input('Enter element: ')))


print('List:', list)
print(f'Largest: {max(list)}\nSmallest: {min(list)}\nSum: {sum(list)}\nAverage: {sum(list)/n}')

num = int(input('Enter number to count: '))
print(f'Number of occurances of {num}: {list.count(num)}')