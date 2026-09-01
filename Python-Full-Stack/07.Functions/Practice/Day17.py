# Day 17 - Recursive Functions


# 1. Recursion
def count_down(n):
    if n == 0:                 # Base Case
        return
    print(n)
    count_down(n - 1)          # Recursive Case


count_down(5)


# 2. Factorial using Recursion
def factorial(n):
    if n == 0:                 # Base Case
        return 1
    return n * factorial(n - 1)  # Recursive Case


print("Factorial:", factorial(5))


# 3. Fibonacci Series using Recursion
def fibonacci(n):
    if n <= 1:                 # Base Case
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)


print("Fibonacci Series:")

for i in range(8):
    print(fibonacci(i), end=" ")