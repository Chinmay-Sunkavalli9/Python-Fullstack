# Day 14 - Nested Loops and Pattern Programs


# 1. Nested for loops
for i in range(1, 4):
    for j in range(1, 4):
        print("*", end=" ")
    print()


# 2. Rows and columns
for row in range(3):
    for col in range(4):
        print("*", end=" ")
    print()


# 3. Square pattern
for i in range(5):
    for j in range(5):
        print("*", end=" ")
    print()


# 4. Rectangle pattern
for i in range(3):
    for j in range(6):
        print("*", end=" ")
    print()


# 5. Increasing triangle
for i in range(1, 6):
    for j in range(i):
        print("*", end=" ")
    print()


# 6. Decreasing triangle
for i in range(5, 0, -1):
    for j in range(i):
        print("*", end=" ")
    print()


# 7. Number pattern
for i in range(1, 6):
    for j in range(1, i + 1):
        print(j, end=" ")
    print()


# 8. Alphabet pattern
for i in range(1, 6):
    for j in range(i):
        print(chr(65 + j), end=" ")
    print()


# 9. Pyramid pattern
for i in range(1, 6):
    print(" " * (5 - i), end="")
    for j in range(i):
        print("* ", end="")
    print()


# 10. Hollow square pattern
n = 5

for i in range(n):
    for j in range(n):
        if i == 0 or i == n - 1 or j == 0 or j == n - 1:
            print("*", end=" ")
        else:
            print(" ", end=" ")
    print()