import numpy as np

arr = np.array([[1, 2, 3], [4, 5, 6]])
'''# Shape
print("Shape:", arr.shape)
# Reshape
print("Reshape:")
print(arr.reshape(3, 2))
# Flatten
print("Flatten:", arr.flatten())
# Transpose
print("Transpose:")
print(arr.T)
# Indexing & Slicing
print("Element:", arr[0, 1])
print("First Row:", arr[0])
print("Slice:")
print(arr[:, 1:])

# Mathematical Operations
print("Addition:")
print(arr + 2)

print("Multiplication:")
print(arr * 2)'''

print("Square:")
print(arr ** 2)

print("Square Root:")
print(np.sqrt(arr))

# Statistics
print("Sum:", np.sum(arr))
print("Mean:", np.mean(arr))
print("Median:", np.median(arr))
print("Standard Deviation:", np.std(arr))
print("Minimum:", np.min(arr))
print("Maximum:", np.max(arr))

# Boolean Filtering
print("Values greater than 3:", arr[arr > 3])