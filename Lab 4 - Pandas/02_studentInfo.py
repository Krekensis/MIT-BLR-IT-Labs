# Create a data frame with details of 10 students and columns as
# Roll Number, Name, Gender, Marks1, Marks2, Marks3.
# a. Create a new column with total marks
# b. Find the lowest marks in Marks1
# c. Find the Highest marks in Marks2
# d. Find the average marks in Marks3
# e. Find student name with highest average
# f. Find how many students failed in Marks2 (<40)

import pandas as pd

data = {
    'Roll Number': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    'Name': ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'],
    'Gender': ['M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F'],
    'Marks1': [90, 85, 70, 60, 50, 40, 30, 20, 10, 0],
    'Marks2': [80, 75, 60, 50, 40, 30, 20, 10, 0, 90],
    'Marks3': [70, 65, 50, 40, 30, 20, 10, 0, 90, 80]
}

df = pd.DataFrame(data)
print(df)

df['Total Marks'] = df['Marks1'] + df['Marks2'] + df['Marks3']
print('\nData Frame with Total Marks:\n\n', df)

print('\nLowest marks in Marks1:', df['Marks1'].min())
print('Highest marks in Marks2:', df['Marks2'].max())
print('Average marks in Marks3:', df['Marks3'].mean())

highest_avg = df['Total Marks'].idxmax()
print('Student with highest average:', df['Name'][highest_avg])

failed = df[df['Marks2'] < 40]
print('Number of students failed in Marks2:', len(failed))
