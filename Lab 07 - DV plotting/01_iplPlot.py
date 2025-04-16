'''
1. For the IPL dataset, answer the specified questions with summarization and effective visuals using Matplotlib & Seaborn libraries
a) Run Distribution Per Over: Plot a boxplot using Seaborn to visualize the distribution of total runs scored in each over (column: over vs. total_runs).
b) Most Successful Batters: Use a bar chart in Matplotlib to show the top 10 batters with the highest total runs.
c) Extras Analysis: Create a count plot in Seaborn to display the frequency of different extra types (column: extras_type).
d) Wicket Analysis: Plot a pie chart using Matplotlib to show the proportion of different modes of dismissal (column: dismissal_kind).
e) Bowler Economy Rate: Use a scatter plot in Seaborn to visualize the economy rate of bowlers (total runs conceded per over) against the number of overs bowled.
'''

import pandas as pd
import matplotlib.pyplot as mplot
import seaborn as sea

data = pd.read_csv("./Datasets/IPL.csv")
print('\nInitial data:\n', data)

#a
mplot.figure(figsize=(8, 6))
sea.boxplot(data, x="over", y="total_runs", palette='plasma')
mplot.title('Distribution of total runs scored in each over')
mplot.xlabel('Over')
mplot.ylabel('Total Runs')
mplot.savefig("./Lab 07 - DV plotting/Graphs/Q1_a_boxplot.png")
mplot.show()

#b
top_batters = data.groupby('batter')['total_runs'].sum().nlargest(10).reset_index()
top_batters = top_batters.sort_values(by='total_runs', ascending=False)

mplot.figure(figsize=(9, 8))
mplot.bar(top_batters['batter'], top_batters['total_runs'], )
#sea.barplot(data=top_batters, x='batter', y='total_runs', palette='viridis')
mplot.title('Top 10 batters with highest total runs')
mplot.xlabel('Batter')
mplot.ylabel('Total Runs')
mplot.xticks(rotation=30)
mplot.savefig("./Lab 07 - DV plotting/Graphs/Q1_b_barplot.png")
mplot.show()

#c
mplot.figure(figsize=(8, 6))
sea.countplot(data=data, x='extras_type', palette='viridis')
mplot.title('Frequency of different extra types')
mplot.savefig("./Lab 07 - DV plotting/Graphs/Q1_c_countplot.png")
mplot.show()


#d
dkind = data['dismissal_kind'].value_counts()
labels = [f'{label} ({val:.2f}%)' for label, val in zip(dkind.index, 100 * dkind / dkind.sum())]

mplot.figure(figsize=(10, 6))
mplot.pie(dkind)
mplot.legend(labels, title="Dismissal Kind", loc=(0.8, 0.3))
mplot.title('Proportion of different modes of dismissal')
mplot.axis('equal')
mplot.savefig("./Lab 07 - DV plotting/Graphs/Q1_d_piechart.png")
mplot.show()

#e
bowler_stats = data.groupby('bowler').agg({
    'total_runs': 'sum',
    'ball': 'count'
}).reset_index()

# Calculate overs and economy
bowler_stats['overs'] = bowler_stats['ball'] / 6
bowler_stats['economy'] = bowler_stats['total_runs'] / bowler_stats['overs']

mplot.figure(figsize=(10, 6))
sea.scatterplot(data=bowler_stats, x='economy', y='overs', alpha=0.7)
mplot.xlabel('Economy')
mplot.ylabel('Overs Bowled')
mplot.title('Bowler Economy vs Overs Bowled (IPL Dataset)')
mplot.grid(True)
mplot.savefig("./Lab 07 - DV plotting/Graphs/Q1_e_scatterplot.png")
mplot.show()