# Write a python function to input 2 numbers and perform the calculator opertions of (+,-,*,/).

def calc(a, b, op):
    if (op == '+' or op == 'add'):
        return(a + b);

    elif (op == '-' or op == 'subtract'):
        return(a - b);

    elif (op == '*' or op == 'multiply'):
        return(a * b);

    elif (op == '/' or op == 'divide'):
        if (b == 0):
            return 'Division by zero is not allowed'
        else:
            return(a / b);
    else:
        return 'Invalid operator'


a = int(input('Enter first number: '))
b = int(input('Enter second number: '))
op = input('Enter operator: ')
print(calc(a, b, op))
