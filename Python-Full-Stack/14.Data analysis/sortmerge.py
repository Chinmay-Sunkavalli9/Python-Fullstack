import pandas as pd
df = pd.DataFrame({
    "Product": ["Laptop", "Phone", "Earbuds", "Watch"],
    "Brand": ["A", "B", "A", "B"],
    "Price": [50000, 20000, 3000, 5000]
})

# Sorting
print("Sorted:")
print(df.sort_values(by="Price", ascending=False))

# Ranking
df["Rank"] = df["Price"].rank(ascending=False)
print("\nRanking:")
print(df)

# Merge
df1 = pd.DataFrame({
    "Product": ["Laptop", "Phone"],
    "Price": [50000, 20000]
})

df2 = pd.DataFrame({
    "Product": ["Laptop", "Phone"],
    "Stock": [10, 25]
})

print("\nMerged:")
print(pd.merge(df1, df2, on="Product", how="inner"))

# Concatenation
print("\nConcatenated:")
print(pd.concat([df1, df2], axis=0))

# Pivot Table
print("\nPivot Table:")
print(df.pivot_table(
    values="Price",
    index="Brand",
    aggfunc="mean"
))

# Time Series
dates = pd.to_datetime([
    "2026-01-01",
    "2026-02-01",
    "2026-03-01",
    "2026-04-01"
])

df["Purchase Date"] = dates
df.set_index("Purchase Date", inplace=True)

print("\nTime Series:")
print(df)
