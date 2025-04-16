'''
For the SENTIMENT dataset, answer the specified questions with
string operations and effective visuals:

1. Replace missing values in the "Text" column with "No review provided"
2. Remove duplicate rows
3. Convert Sentiment column to numerical values
4. Find unique reviews count
5. Replace all occurrences of "bad" with "poor"
6. Find longest and shortest reviews
7. Create a bar chart for Positive vs. Negative reviews
8. Plot a histogram showing the distribution of review lengths
'''

import pandas as pd
import matplotlib.pyplot as mplot

df = pd.read_csv("./Datasets/sentiment.csv")

# 1
df['Text'] = df['Text'].fillna("No review provided")

# 2
df = df.drop_duplicates()

# 3
df['Sentiment'] = df['Sentiment'].map({'Positive': 1, 'Negative': 0})

# 4
unique_reviews_count = df['Text'].nunique()
print(f"Number of unique reviews: {unique_reviews_count}")

# 5
df['Text'] = df['Text'].str.replace('bad', 'poor', case=False)

# 6
df['Review_Length'] = df['Text'].apply(len)
longest_review = df.loc[df['Review_Length'].idxmax(), 'Text']
shortest_review = df.loc[df['Review_Length'].idxmin(), 'Text']
print(f"Longest review: {longest_review}")
print(f"Shortest review: {shortest_review}")

# 7
df['Sentiment'].value_counts().plot(kind='bar', color=['red', 'green'])
mplot.xticks(ticks=[0, 1], labels=['Negative', 'Positive'], rotation=0)
mplot.xlabel("Sentiment")
mplot.ylabel("Count")
mplot.title("Positive vs. Negative Reviews")
mplot.savefig("./Lab 09/Graphs/Q1_g_barplot.png")
mplot.show()

# 8
mplot.hist(df['Review_Length'], bins=10, color="#7462de", edgecolor="black")
mplot.xlabel("Review Length")
mplot.ylabel("Frequency")
mplot.title("Distribution of Review Lengths")
mplot.savefig("./Lab 09/Graphs/Q1_h_histogram.png")
mplot.show()