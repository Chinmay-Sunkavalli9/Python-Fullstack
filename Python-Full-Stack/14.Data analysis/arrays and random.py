import numpy as np
# Special Arrays
print("Zeros:")
print(np.zeros((2, 3)))
print("Ones:")
print(np.ones((2, 3)))

print("Identity:")
print(np.eye(3))

print("Full:")
print(np.full((2, 3), 7))

# Number Generation
print("Arange:", np.arange(1, 10, 2))
print("Linspace:", np.linspace(1, 10, 5))

# Random Numbers
np.random.seed(10)
print("Random Integer:", np.random.randint(1, 10, 5))
print("Random:", np.random.rand(5))
print("Random Normal:", np.random.randn(5))
print("Random Choice:", np.random.choice([10, 20, 30, 40]))