# Write a Python code block that inputs a sentence from the user. 
# Count the frequency of each word in the sentence and store the result in a dictionary. 
# Print the dictionary with words as keys and their frequencies as values.

sentence = input('Enter a sentence: ')
words = sentence.split()
wordDict = {}

for word in words:
    if word in wordDict:
        wordDict[word] += 1
    else:
        wordDict[word] = 1

print(wordDict)
