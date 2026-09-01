# Day 11 - Loops

# For Loop
for i in range(1, 6):
    print(i)


# Iterable and Iterator
numbers = [10, 20, 30]

iterator = iter(numbers)

print(next(iterator))
print(next(iterator))
print(next(iterator))


# range() Function
for i in range(1, 11):
    print(i)


# Reverse Loop
for i in range(10, 0, -1):
    print(i)


# Printing Even Numbers using For Loop
for i in range(1, 21):
    if i % 2 == 0:
        print("Even:", i)


# Using if inside a For Loop
numbers = [5, 12, 8, 20, 3, 15]

for number in numbers:
    if number > 10:
        print("Greater than 10:", number)