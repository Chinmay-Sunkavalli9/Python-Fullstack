# Day 16 - Lambda Functions and Call by Object Reference


# 1. Anonymous / Lambda Function
square = lambda x: x * x
print("Square:", square(5))


# 2. Lambda Syntax
add = lambda a, b: a + b
print("Addition:", add(10, 20))


# 3. filter()
numbers = [1, 2, 3, 4, 5, 6]

even_numbers = list(filter(lambda x: x % 2 == 0, numbers))
print("Even numbers:", even_numbers)


# 4. map()
numbers = [1, 2, 3, 4, 5]

squares = list(map(lambda x: x * x, numbers))
print("Squares:", squares)


# 5. reduce()
from functools import reduce

numbers = [1, 2, 3, 4, 5]

total = reduce(lambda a, b: a + b, numbers)
print("Sum:", total)


# 6. Sorting using Lambda
students = [
    ("Chinmay", 22),
    ("Rahul", 20),
    ("Kiran", 24)
]

students.sort(key=lambda x: x[1])
print("Sorted students:", students)


# 7. Call by Object Reference - Mutable Object
def add_item(items):
    items.append("Python")


languages = ["Java", "C"]

add_item(languages)

print("Languages:", languages)


# 8. Immutable Object
def change_number(num):
    num = num + 10
    print("Inside function:", num)


number = 20

change_number(number)

print("Outside function:", number)


# 9. Mutable and Immutable Objects

# Mutable - List
numbers = [10, 20]

def modify_list(data):
    data.append(30)

modify_list(numbers)

print("Mutable object:", numbers)


# Immutable - Integer
number = 10

def modify_number(value):
    value = value + 20

modify_number(number)

print("Immutable object:", number)