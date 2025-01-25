# Create a python function that creates sequence between 1 and 100 and prints all the odd numbers. 
# Compute and display the sum of all the even numbers.

def printOddAndSumOfEven():
    sum = 0
    for i in range(1, 101):
        if i % 2 == 0:
            sum += i
        else:
            print(i, end=" ")
    print('\nSum of even numbers:', sum)

printOddAndSumOfEven()