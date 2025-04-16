# Write a function which takes string input from the user and counts the number of vowels and consonants

def countCharType(s):
    vowels = 0
    consonants = 0
    other = 0
    for i in s:
        if i.isalpha():
            if i in 'aeiouAEIOU':
                vowels += 1
            else:
                consonants += 1
        else:
            other += 1

    print('Number of vowels:', vowels)
    print('Number of consonants:', consonants)
    print('Number of other characters:', other)

s = input('Enter a string: ')
countCharType(s)