# Day 8 - Lists and Tuples

# List Creation and Properties
fruits = ["Apple", "Mango", "Orange", "Banana"]

print("List:", fruits)
print("Length:", len(fruits))


# List Indexing and Slicing
print("First element:", fruits[0])
print("Last element:", fruits[-1])
print("Slicing:", fruits[1:3])


# List Operations
numbers = [1, 2, 3]

print("Concatenation:", numbers + [4, 5])
print("Repetition:", numbers * 2)


# List Methods
fruits.append("Grapes")
print("After append:", fruits)

fruits.insert(1, "Pineapple")
print("After insert:", fruits)

fruits.remove("Banana")
print("After remove:", fruits)

fruits.pop()
print("After pop:", fruits)

fruits.sort()
print("After sort:", fruits)

fruits.reverse()
print("After reverse:", fruits)


# Tuple Creation and Properties
colors = ("Red", "Blue", "Green", "Yellow")

print("Tuple:", colors)
print("Length:", len(colors))


# Tuple Indexing and Slicing
print("First element:", colors[0])
print("Last element:", colors[-1])
print("Slicing:", colors[1:3])


# Tuple Operations and Methods
tuple1 = (1, 2, 3)
tuple2 = (4, 5, 6)

print("Concatenation:", tuple1 + tuple2)
print("Repetition:", tuple1 * 2)
print("Count:", tuple1.count(2))
print("Index:", tuple1.index(3))


# Tuple Packing
student = "Chinmay", 22, "Python"
print("Packed Tuple:", student)


# Tuple Unpacking
name, age, course = student

print("Name:", name)
print("Age:", age)
print("Course:", course)


# Difference between List and Tuple
my_list = [10, 20, 30]
my_tuple = (10, 20, 30)

print("List:", my_list)
print("Tuple:", my_tuple)

print("List is mutable")
print("Tuple is immutable")