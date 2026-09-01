# Day 15 - Functions in Python


# 1. Creating and Calling a Function
def greet():
    print("Hello, Chinmay")


greet()


# 2. Parameters and Arguments
def add(a, b):
    print(a + b)


add(10, 20)


# 3. Return Statement
def multiply(a, b):
    return a * b


result = multiply(5, 4)
print("Result:", result)


# 4. Positional Arguments
def student(name, age):
    print("Name:", name)
    print("Age:", age)


student("Chinmay", 20)


# 5. Keyword Arguments
student(age=20, name="Chinmay")


# 6. Default Arguments
def welcome(name="Chinmay"):
    print("Welcome", name)


welcome()
welcome("Python")


# 7. *args
def total(*numbers):
    print("Numbers:", numbers)
    print("Total:", sum(numbers))


total(10, 20, 30)
total(5, 10, 15, 20)


# 8. **kwargs
def details(**data):
    print(data)


details(name="Chinmay", age=20, course="Python")


# 9. *args and **kwargs together
def display(*args, **kwargs):
    print("Arguments:", args)
    print("Details:", kwargs)


display(10, 20, 30, name="Chinmay", course="Python")