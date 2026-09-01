# Day 6 - Python Operators

# Arithmetic Operators
a = 10
b = 3

print("Addition:", a + b)
print("Subtraction:", a - b)
print("Multiplication:", a * b)
print("Division:", a / b)
print("Floor Division:", a // b)
print("Modulus:", a % b)
print("Exponent:", a ** b)


# Assignment Operators
x = 10

x += 5
print("After +=:", x)

x -= 3
print("After -=:", x)

x *= 2
print("After *=:", x)

x /= 4
print("After /=:", x)


# Comparison Operators
p = 10
q = 20

print("p == q:", p == q)
print("p != q:", p != q)
print("p > q:", p > q)
print("p < q:", p < q)
print("p >= q:", p >= q)
print("p <= q:", p <= q)


# Logical Operators
age = 22

print("AND:", age > 18 and age < 30)
print("OR:", age < 18 or age > 20)
print("NOT:", not(age > 18))


# Membership Operators
fruits = ["Apple", "Mango", "Orange"]

print("Mango in fruits:", "Mango" in fruits)
print("Banana not in fruits:", "Banana" not in fruits)


# Identity Operators
a = 10
b = 10

print("a is b:", a is b)
print("a is not b:", a is not b)


# Bitwise Operators
a = 5
b = 3

print("Bitwise AND:", a & b)
print("Bitwise OR:", a | b)
print("Bitwise XOR:", a ^ b)
print("Bitwise NOT:", ~a)
print("Left Shift:", a << 1)
print("Right Shift:", a >> 1)


# Operator Precedence
result = 10 + 5 * 2
print("Operator Precedence:", result)