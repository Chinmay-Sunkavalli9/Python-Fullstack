import pandas as pd

# Series
prices = pd.Series(
    [2999, 15999, 52999, 4999, 1999],
    index=["Earbuds", "Smartphone", "Laptop", "Smartwatch", "Speaker"]
)

print(prices)
print("Mean:", prices.mean())
print("Maximum:", prices.max())
print("First 3:")
print(prices.head(3))

# DataFrame
data = {
    "Product": ["Earbuds", "Smartphone", "Laptop", "Smartwatch", "Speaker"],
    "Brand": ["A", "B", "C", "D", "E"],
    "Price": [2999, 15999, 52999, 4999, 1999],
    "Stock": [50, 30, 20, 40, 60]
}

df = pd.DataFrame(data)

print(df)
print("Shape:", df.shape)
print("Columns:", df.columns)
print("Index:", df.index)

df.info()
print(df.describe())