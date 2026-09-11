import pandas as pd

df = pd.DataFrame({
    "Product": ["Earbuds", "Phone", "Laptop", "Watch"],
    "Brand": ["A", "B", "A", "B"],
    "Price": [3000, None, 50000, 5000],
    "Stock": [50, 30, None, 40]
})

# Missing Values
print(df.isnull().sum())

df = df.fillna(0)

# Change Data Type
df["Price"] = df["Price"].astype(float)

# Rename Column
df.rename(columns={"Product": "Product Name"}, inplace=True)

# Drop Column
df.drop(columns=["Stock"], inplace=True)

# GroupBy
print(df.groupby("Brand")["Price"].mean())

# Aggregation
print(df.groupby("Brand").agg({
    "Price": ["mean", "max", "min"]
}))