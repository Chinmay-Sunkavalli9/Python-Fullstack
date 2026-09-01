# Day 9 - Sets and Dictionaries

# Set Creation
numbers = {10, 20, 30, 40, 20}
print("Set:", numbers)


# Set Operations
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}

print("Union:", a.union(b))
print("Intersection:", a.intersection(b))
print("Difference:", a.difference(b))


# Set Methods
colors = {"Red", "Blue", "Green"}

colors.add("Yellow")
print("After add:", colors)

colors.remove("Blue")
print("After remove:", colors)

colors.discard("Black")
print("After discard:", colors)

print("Is Green present:", "Green" in colors)


# Dictionary Creation
student = {
    "name": "Chinmay",
    "age": 22,
    "course": "Python"
}

print("Dictionary:", student)


# Accessing Dictionary Values
print("Name:", student["name"])
print("Age:", student["age"])
print("Course:", student["course"])


# Adding Key-Value Pair
student["city"] = "Hyderabad"
print("After adding city:", student)


# Updating Value
student["age"] = 23
print("After updating age:", student)


# Dictionary Methods
print("Keys:", student.keys())
print("Values:", student.values())
print("Items:", student.items())

print("Get course:", student.get("course"))

student.update({"experience": "Fresher"})
print("After update:", student)

student.pop("city")
print("After pop:", student)