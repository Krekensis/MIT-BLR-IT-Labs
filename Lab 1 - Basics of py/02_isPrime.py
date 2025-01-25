# Write a python function that takes an integer as input and returns True if the number is prime, False otherwise.

def isPrime(n):
    if n <= 1:
        return False
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

n = int(input('Enter a number: '))
if n < 0:
    print('Number must be greater than or equal to 0')
    exit()

if n == 1:
    print('1 is neither prime nor composite')
    exit()

if isPrime(n):
    print('Number is prime')
else:
    print('Number is not Prime')