# Day 10 - Conditional Statements

# if Statement
age = 20

if age >= 18:
    print("You are eligible to vote")


# if-else Statement
number = 10

if number % 2 == 0:
    print("Even number")
else:
    print("Odd number")


# if-elif-else Statement
marks = 75

if marks >= 90:
    print("Grade A")
elif marks >= 70:
    print("Grade B")
elif marks >= 50:
    print("Grade C")
else:
    print("Fail")


# Nested if Statement
age = 22
has_id = True

if age >= 18:
    print("Age is valid")

    if has_id:
        print("ID is available")
    else:
        print("ID is not available")
else:
    print("Age is below 18")