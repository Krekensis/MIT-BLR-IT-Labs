'''
2.  For the CEREALS dataset, perform data preprocessing and
    answer the following questions.
a.  Create a table with the 5 number summary of all the numeric
    attributes.
b.  For each of the numeric attributes (proteins upto vitamins) ,
    identify and replace all missing data(indicated with -1) with
    the arithmetic mean of the attribute.
c.  Create a table with the 5 number summary of all the numeric
    attributes after treating missing values. Do you think the
    strategy used in dealing with missing values was effective?
d.  For each numeric attribute (proteins upto vitamins), identify
    and replace all noisy data with the median of attribute.
e.  Create a table with the 5 number summary of all the numeric
    attributes after treating noisy values. Do you think the
    strategy used in dealing with noisy values was effective?
'''

import pandas as pd
import numpy as np

data = pd.read_csv("./Datasets/cereal.csv")
data = data.drop(columns=["Cold", "Nabisco", "Quaker", "Kelloggs", "GeneralMills", "Ralston", "AHFP"], index=range(10,77))

print('\nInitial data:\n', data)

for column in data.columns:
    if data[column].dtype in [np.int64, np.float64]:
        mean_value = data[column][data[column] != -1].mean()
        data[column] = data[column].replace(-1, float(f"{mean_value:.2f}"))

print('\nData after replacing -1 with mean:\n', data)
print("\n5 number summary:\n", data.describe().loc[['min', '25%', '50%', '75%', 'max']])

for column in data.columns:
    if data[column].dtype in [np.int64, np.float64]:
        median_value = data[column].median()
        data[column] = data[column].replace(data[column].max(), float(f"{median_value:.2f}"))
        data[column] = data[column].replace(data[column].min(), float(f"{median_value:.2f}"))

print('\nData after replacing noisy values with median:\n', data)
print("\n5 number summary:\n", data.describe().loc[['min', '25%', '50%', '75%', 'max']])


