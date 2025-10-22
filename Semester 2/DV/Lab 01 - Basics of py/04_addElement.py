# Write a function to add 2 elements and display the result.
# The elements can be of type int, float or string.

def addElements(type):
    a = input('Enter first element: ')
    b = input('Enter second element: ')

    if (type == 'int'):
        a, b = int(a), int(b)

    elif (type == 'float'):
        a, b = float(a), float(b)

    elif (type == 'str' or type == 'string'): 
        a, b = str(a), str(b)

    else:
        print('Invalid type')
        exit()

    print(a + b)

type = input('Enter type: ')
addElements(type)