'''
For the case study given, answer the questions with a report
with story, visuals and data summaries.

1. What is the daily sales trend over time? Plot a line chart.
2. Which day of the week has the highest sales? Plot Bar Chart X-axis: Day of the week Y-axis: Total Sales
3. Which product category generates the most revenue?
4. Which payment method is most preferred by customers? [Plot Pie Chart]
5. How does customer rating vary by product category? [Plot Box plot]
6. Is there a correlation between total sales and customer rating? [Visualization: Scatter Plot, X-axis: Total Sales Y-axis: Customer Rating

'''
import pandas as pd
import matplotlib.pyplot as mplot
import seaborn as sea

df = pd.read_csv("./Datasets/supermarket_sales.csv")

df['Date'] = pd.to_datetime(df['Date'])
df['DayOfWeek'] = df['Date'].dt.day_name()

# 1
mplot.figure(figsize=(12, 7))
dailySales = df.groupby('Date')['Total'].sum()
dailySales.plot(title='Daily Sales Trend', marker='o')
mplot.xlabel('Date')
mplot.ylabel('Total Sales')
mplot.savefig("./Lab 11/Graphs/Q1_a_linechart.png")
mplot.show()

# 2
mplot.figure(figsize=(8, 6))
daySales = df.groupby('DayOfWeek')['Total'].sum()
sea.barplot(x=daySales.index, y=daySales.values, palette='viridis')
mplot.xlabel('Day of the Week')
mplot.ylabel('Total Sales')
mplot.title('Sales by Day of the Week')
mplot.savefig("./Lab 11/Graphs/Q1_b_barplot.png")
mplot.show()

# 3
mplot.figure(figsize=(9, 8))
catRevenue = df.groupby('Product line')['Total'].sum()
mplot.bar(catRevenue.index, catRevenue.values, color='blue')
sea.barplot(x=catRevenue.index, y=catRevenue.values, palette='plasma')
mplot.xlabel('Product Line')
mplot.ylabel('Total Revenue')
mplot.title('Revenue by Product Line')
mplot.xticks(rotation=15)
mplot.savefig("./Lab 11/Graphs/Q1_c_barplot.png")
mplot.show()

# 4
mplot.figure(figsize=(7, 7))
payCount = df['Payment'].value_counts()
mplot.pie(payCount, labels=payCount.index, autopct='%1.1f%%', colors=['lightblue', 'lightgreen', 'lightcoral'])
mplot.title('Preferred Payment Method')
mplot.savefig("./Lab 11/Graphs/Q1_d_piechart.png")
mplot.show()

# 5
mplot.figure(figsize=(14, 6))
sea.boxplot(x='Rating', y='Product line', data=df, palette='Set2', orient='h')
mplot.xlabel('Rating')
mplot.ylabel('Product Line')
mplot.title('Customer Rating by Product Line')
mplot.savefig("./Lab 11/Graphs/Q1_e_boxplot.png")
mplot.show()

# 6
mplot.figure(figsize=(8, 5))
mplot.scatter(df['Total'], df['Rating'], alpha=0.5, color='purple')
mplot.xlabel('Total Sales')
mplot.ylabel('Customer Rating')
mplot.title('Correlation between Total Sales and Customer Rating')
mplot.savefig("./Lab 11/Graphs/Q1_f_scatterplot.png")
mplot.show()