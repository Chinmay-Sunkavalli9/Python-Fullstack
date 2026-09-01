# Day 7 - User Input and Output

# Taking User Input
name = input("Enter your name: ")
print("Hello", name)


# Type Conversion
age = int(input("Enter your age: "))
print("Age:", age)

height = float(input("Enter your height: "))
print("Height:", height)


# List Input
fruits = input("Enter 3 fruits: ").split()
print("Fruits:", fruits)


# Tuple Input
numbers = tuple(map(int, input("Enter numbers: ").split()))
print("Tuple:", numbers)


# Set Input
values = set(map(int, input("Enter numbers: ").split()))
print("Set:", values)


# Dictionary Input
student_name = input("Enter student name: ")
student_age = int(input("Enter student age: "))
student_course = input("Enter course: ")

student = {
    "name": student_name,
    "age": student_age,
    "course": student_course
}

print("Student:", student)


# Multiple Inputs using split()
first_name, last_name = input("Enter first and last name: ").split()
print("First Name:", first_name)
print("Last Name:", last_name)


# Multiple Integer Inputs
a, b, c = map(int, input("Enter three numbers: ").split())

print("Numbers:", a, b, c)


# sep Parameter
print("Python", "Full", "Stack", sep="-")


# end Parameter
print("Learning", end=" ")
print("Python")


# Formatted Output using f-string
name = "Chinmay"
age = 20
course = "Python"

print(f"My name is {name}. I am {age} years old and learning {course}.")


# Formatted Output using str.format()
name = "Chinmay"
age = 20

print("My name is {} and I am {} years old.".format(name, age))