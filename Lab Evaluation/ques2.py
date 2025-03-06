'''
1 Python program to find the area of a triangle whose sides are given
2 Python program to find out the average of a set of integers
3 Python program to check whether the given integer is a multiple of both 5 and 7
4 Python program to find the average of 10 numbers using while loop
5 Python program to display the given integer in a reverse manner
6 Python program to display all integers within the range 100-200 whose sum of digits is an even number
7 Python program to generate the prime numbers from 1 to N
8 Python program to find the Nth term in a Fibonacci series using recursion
'''

# 1
def tArea(a, b, c):
    s = (a + b + c) / 2
    area = (s * (s - a) * (s - b) * (s - c)) ** 0.5
    return area

# 2
def intAvg(*args):
    return sum(args) / len(args)

# 3
def multiple5and7(n):
    return n % 5 == 0 and n % 7 == 0

# 4
def avg10():
    total = 0
    count = 0
    while count < 10:
        total += int(input('Enter a number: '))
        count += 1
    return total / 10

# 5
def revInt(n):
    return int(str(n)[::-1])

# 6
def digitSum(n):
    return sum(map(int, str(n)))

def even_digitSum():
    for i in range(100, 201):
        if digitSum(i) % 2 == 0:
            print(i)

# 7
def isPrime(n):
    if n < 2:
        return False
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

def prime_numbers(n):
    for i in range(1, n + 1):
        if isPrime(i):
            print(i)

# fibonacci function print every iteration of the fibonacci series
def fibonacci(n):
    if n <= 1:
        return n
    else:
        return fibonacci(n - 1) + fibonacci(n - 2)

print("#1\n", tArea(3, 4, 5))
print("#2\n", intAvg(1, 2, 3, 4, 5))
print("#3\n", multiple5and7(35))
print("#4\n", avg10())
print("#5\n", revInt(12345))
print("#6\n",)
even_digitSum()
print("#7\n")
prime_numbers(100)

def fibonacci_series(n):
    fib_series = []
    for i in range(n):
        fib_series.append(fibonacci(i))
    return fib_series

print("#8\n", fibonacci_series(10))