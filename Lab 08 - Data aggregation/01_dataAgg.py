'''
DATASET IS FUCKED UP


import pandas as pd
import matplotlib.pyplot as plt
#Lab 08
# Load datasets
file_paths = {
    "customers": "customers.csv",
    "employees": "employees.csv",
    "order_details": "order-details.csv",
    "orders": "orders.csv",
    "products": "products.csv",
    "shippers": "shippers.csv",
    "suppliers": "suppliers.csv"
}

def load_data():
    data = {}
    for name, path in file_paths.items():
        data[name] = pd.read_csv(path, sep=",", na_values=["NULL"], on_bad_lines='skip')
        data[name].columns = data[name].columns.str.strip()  # Clean column names
    return data

# Load cleaned data
data = load_data()

# Merge order details with orders
data["order_details"]["total_sales"] = data["order_details"]["unitPrice"] * data["order_details"]["quantity"]
merged_orders = data["order_details"].merge(data["orders"], on="orderID")

# 1. Total Sales per Country
sales_by_country = merged_orders.groupby("shipCountry")["total_sales"].sum().reset_index()
sales_by_country = sales_by_country.sort_values(by="total_sales", ascending=False)

# 2. Average Order Value per Customer
sales_by_order = data["order_details"].groupby("orderID")["total_sales"].sum().reset_index()
merged_orders_customers = sales_by_order.merge(data["orders"][["orderID", "customerID"]], on="orderID")
avg_order_value = merged_orders_customers.groupby("customerID")["total_sales"].mean().reset_index()
avg_order_value = avg_order_value.sort_values(by="total_sales", ascending=False)

# 3. Orders per Employee
orders_per_employee = data["orders"].groupby("employeeID")["orderID"].count().reset_index()
orders_per_employee = orders_per_employee.rename(columns={"orderID": "order_count"}).sort_values(by="order_count", ascending=False)

# 4. Best-selling Products
products_sold = data["order_details"].groupby("productID")["quantity"].sum().reset_index()
products_sold = products_sold.merge(data["products"][["productID", "productName"]], on="productID")
products_sold = products_sold.sort_values(by="quantity", ascending=False)

# 5. Average Delivery Time per Shipper
data["orders"]["orderDate"] = pd.to_datetime(data["orders"]["orderDate"], errors="coerce")
data["orders"]["shippedDate"] = pd.to_datetime(data["orders"]["shippedDate"], errors="coerce")
data["orders"]["delivery_time"] = (data["orders"]["shippedDate"] - data["orders"]["orderDate"]).dt.days
avg_delivery_time = data["orders"].groupby("shipVia")["delivery_time"].mean().reset_index()
avg_delivery_time = avg_delivery_time.merge(data["shippers"], left_on="shipVia", right_on="shipperID")
avg_delivery_time = avg_delivery_time[["companyName", "delivery_time"]].sort_values(by="delivery_time")

# Visualization
plt.figure(figsize=(10, 5))
plt.bar(sales_by_country["shipCountry"].head(10), sales_by_country["total_sales"].head(10))
plt.xlabel("Country")
plt.ylabel("Total Sales")
plt.title("Top 10 Countries by Sales")
plt.xticks(rotation=45)
plt.show()

plt.figure(figsize=(10, 5))
plt.bar(products_sold["productName"].head(10), products_sold["quantity"].head(10))
plt.xlabel("Product")
plt.ylabel("Quantity Sold")
plt.title("Top 10 Best-Selling Products")
plt.xticks(rotation=45)
plt.show()

plt.figure(figsize=(8, 5))
plt.bar(avg_delivery_time["companyName"], avg_delivery_time["delivery_time"])
plt.xlabel("Shipper")
plt.ylabel("Avg Delivery Time (days)")
plt.title("Average Delivery Time per Shipper")
plt.xticks(rotation=45)
plt.show()

'''