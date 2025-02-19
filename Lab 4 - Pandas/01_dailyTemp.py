# Create a Series from a list of integers representing daily temperatures (in Celsius) over a week. 
# Assign index labels as day of the week.
# a. Find and print the average (mean) temperature for the week.
# b. Identify and print the maximum and minimum temperatures and their respective days.
# c. Display the temperatures greater than a specific value.
# d. Convert all temperatures to Fahrenheit.
# e. Print the days had temperatures above the average.

import pandas as pd

temps = pd.Series([20, 22, 25, 27, 30, 28, 26], index=['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'])
print('Temperatures:\n',temps)

print(f"Average temperature: {temps.mean():.2f}")
print(f"Maximum temperature: {temps.max()} on {temps.idxmax()}")
print(f"Minimum temperature: {temps.min()} on {temps.idxmin()}")

print('Temperatures greater than 25:\n', temps[temps > 25])
print('Temperatures in Fahrenheit:\n', temps * 9/5 + 32)
print('Days with temperatures above average:\n', temps[temps > temps.mean()])