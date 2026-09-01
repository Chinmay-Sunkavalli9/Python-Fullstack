# Day 18 - List Comprehension

# 1. Creating a list
numbers = [1, 2, 3, 4, 5]

squares = [x * x for x in numbers]
print("Squares:", squares)


# 2. Filtering elements
even_numbers = [x for x in numbers if x % 2 == 0]
print("Even numbers:", even_numbers)


# 3. Conditional expression
result = ["Even" if x % 2 == 0 else "Odd" for x in numbers]
print("Result:", result)


# 4. String list
names = ["chinmay", "rahul", "kiran"]

upper_names = [name.upper() for name in names]
print("Uppercase names:", upper_names)


# 5. Nested List Comprehension
matrix = [[1, 2], [3, 4], [5, 6]]

flat_list = [num for row in matrix for num in row]
print("Flat list:", flat_list)