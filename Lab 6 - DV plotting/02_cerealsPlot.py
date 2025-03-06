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

data = pd.read_csv('./Datasets/cereal.csv')
data = data.drop(columns=["Cold","Nabisco","Quaker","Kelloggs","GeneralMills","Ralston","AHFP"])
print('\nInitial data:\n', data)

#a1
mplot.figure(figsize=(8, 6))
sea.boxplot(data=data, orient='h', palette='plasma')
mplot.title('Boxplot for cereals dataset')
mplot.xlabel('Values')
mplot.savefig("./Lab 6 - DV plotting/Graphs/Q2_a_boxplot.png")
mplot.show()

#a2
mplot.figure(figsize=(8, 6))
sea.histplot(data=data, palette='viridis')
mplot.title('Histogram for cereals dataset')
mplot.xlabel('Values')
mplot.ylabel('Frequency')
mplot.savefig("./Lab 6 - DV plotting/Graphs/Q2_a_histogram.png")
mplot.show()

#b1
hiRating = data.loc[data['Rating'].idxmax()]
loRating = data.loc[data['Rating'].idxmin()]

mplot.figure(figsize=(8, 6))
sea.barplot(x=['Highest', 'Lowest'], y=[hiRating['Rating'], loRating['Rating']], palette='winter')
mplot.title('Cereals with highest and lowest ratings')
mplot.xlabel('Cereal')
mplot.ylabel('Rating')

for i, v in enumerate([hiRating['Rating'], loRating['Rating']]):
    cereal_name = hiRating['Name'] if i == 0 else loRating['Name']
    mplot.text(i, v, f'{cereal_name} = {v:.2f}', ha='center', va='bottom')

mplot.savefig("./Lab 6 - DV plotting/Graphs/Q2_b_barplot.png")
mplot.show()

#b2
mplot.figure(figsize=(8, 6))
mplot.scatter([0, 1], [hiRating['Rating'], loRating['Rating']], color='#7011d6', s=25)
mplot.title('Cereals with highest and lowest ratings')
mplot.xlabel('Cereal')
mplot.ylabel('Rating')

for i, v in enumerate([hiRating['Rating'], loRating['Rating']]):
    cereal_name = hiRating['Name'] if i == 0 else loRating['Name']
    mplot.text(i, v, f'{cereal_name} = {v:.2f}', ha='center', va='bottom')

mplot.savefig("./Lab 6 - DV plotting/Graphs/Q2_b_scatterplot.png")
mplot.show()

#c
mplot.figure(figsize=(8, 6))
sea.regplot(data=data, x='Sugars', y='Rating', scatter_kws={'color': '#69d6b7', 's': 20}, line_kws={'color': 'red'}, scatter=True)
mplot.title('Scatter plot between Sugar content and Cereal Ratings with Regression Line')
mplot.xlabel('Sugar content')
mplot.ylabel('Rating')
mplot.savefig("./Lab 6 - DV plotting/Graphs/Q2_c_regScatterplot.png")
mplot.show()

#d
avg_rating = data.groupby('Manuf')['Rating'].mean()
mplot.figure(figsize=(8, 6))
sea.barplot(x=avg_rating.index, y=avg_rating.values, palette='viridis')
mplot.title('Average ratings for each Manufacturer')
mplot.xlabel('Manufacturer')
mplot.ylabel('Average Rating')

for i, v in enumerate(avg_rating.values):
    mplot.text(i, v, f'{v:.2f}', ha='center', va='bottom')

mplot.savefig("./Lab 6 - DV plotting/Graphs/Q2_d_barplot.png")
mplot.show()