import numpy as np

arr = np.array([5, 2, 8, 1, 2, 5])

# Sorting & Unique
print("Sorted:", np.sort(arr))
print("Unique:", np.unique(arr))

# Stacking
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

print("Vertical Stack:")
print(np.vstack((a, b)))

print("Horizontal Stack:")
print(np.hstack((a, b)))

# Splitting
print("Split:")
print(np.split(np.array([1, 2, 3, 4, 5, 6]), 2))

# Linear Algebra
A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])

print("Dot Product:")
print(np.dot(A, B))

print("Determinant:", np.linalg.det(A))
print("Inverse:")
print(np.linalg.inv(A))

print("Eigenvalues:")
print(np.linalg.eigvals(A))

# Solve Linear Equations
print("Solution:")
print(np.linalg.solve(A, np.array([5, 11])))