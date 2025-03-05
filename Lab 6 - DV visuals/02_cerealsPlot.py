'''
2. For the CEREALS dataset, answer the specified questions with summarization and effective visuals.
a) What are the key nutritional statistics of cereals, and how are their distributions spread across different attributes? (Use Boxplots & Histograms)
b) Which cereals have the highest and lowest ratings, and how do they compare visually? (Use Bar Chart & Scatter Plot)
c) Is there a correlation between sugar content and cereal ratings? (Use Scatter Plot with Regression Line)
d) Which manufacturer produces the highest-rated cereals on average? (Use Grouped Bar Chart or Boxplot)
'''

import pandas as pd
import matplotlib.pyplot as mplot
import seaborn as sea

data = pd.read_csv('./Datasets/cereals.csv')
print('\nInitial data:\n', data)

mplot.figure(figsize=(8, 6))
sea.boxplot(data=data, orient='h', palette='viridis')
mplot.title('Boxplot for cereals dataset')
mplot.show()

mplot.figure(figsize=(8, 6))
sea.histplot(data=data, kde=True, palette='viridis')
mplot.title('Histogram for cereals dataset')
mplot.show()

hiRating = data.loc[data['Rating'].idxmax()]
loRating = data.loc[data['Rating'].idxmin()]

mplot.figure(figsize=(8, 6))
sea.barplot(x=['Highest', 'Lowest'], y=[hiRating['Rating'], loRating['Rating']], palette='viridis')
mplot.title('Cereals with highest and lowest ratings')
mplot.xlabel('Cereal')
mplot.ylabel('Rating')

for i, v in enumerate([hiRating['Rating'], loRating['Rating']]):
    mplot.text(i, v, f'{v:.2f}', ha='center', va='bottom')

mplot.show()