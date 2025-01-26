# Write a Python code block to create a dictionary of cricket World Cup winners.
# Let the key be the year; the value is the country that won the World Cup that year.
# Print the name of the best-performing country. Display the unique list of countries that have won the World Cup.

winners = {
    1975: 'West Indies',
    1979: 'West Indies',
    1983: 'India',
    1987: 'Australia',
    1992: 'Pakistan',
    1996: 'Sri Lanka',
    1999: 'Australia',
    2003: 'Australia',
    2007: 'Australia',
    2011: 'India',
    2015: 'Australia',
    2019: 'England'
}
uniqueWinners = list(set(winners.values()))
print("Unique countries who who: ", uniqueWinners)

# what id use
bestCountry = max(set(winners.values()), key=list(winners.values()).count)
print('Best performing country:', bestCountry)

# alternatively
from collections import Counter
bestCountry = Counter(winners.values()).most_common(1)[0][0]
print('Best performing country:', bestCountry)

# way longer method which we did in class
counter = []
unique = []
for i in winners.values():
    if i not in unique:
        unique.append(i)

print(unique)
for i in unique:
    x = 0
    for j in winners.values():
        if i == j:
            x += 1
    counter.append(x)

index = counter.index(max(counter))
print('Best performing country:', unique[index])