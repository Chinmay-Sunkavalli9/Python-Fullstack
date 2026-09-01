# Day 13 - Number Programs Using Loops

# 1. Reverse a Number
num = 12345
reverse = 0

while num > 0:
    digit = num % 10
    reverse = reverse * 10 + digit
    num = num // 10

print("Reverse:", reverse)


# 2. Palindrome Number
num = 121
original = num
reverse = 0

while num > 0:
    digit = num % 10
    reverse = reverse * 10 + digit
    num = num // 10

if original == reverse:
    print("Palindrome")
else:
    print("Not Palindrome")


# 3. Count Even Digits
num = 123456
count = 0

while num > 0:
    digit = num % 10

    if digit % 2 == 0:
        count += 1

    num = num // 10

print("Even digits:", count)


# 4. Factors of a Number
num = 12

for i in range(1, num + 1):
    if num % i == 0:
        print("Factor:", i)


# 5. Count Number of Factors
num = 12
count = 0

for i in range(1, num + 1):
    if num % i == 0:
        count += 1

print("Number of factors:", count)


# 6. Factorial of a Number
num = 5
factorial = 1

for i in range(1, num + 1):
    factorial = factorial * i

print("Factorial:", factorial)


# 7. Armstrong Number
num = 153
original = num
sum = 0

while num > 0:
    digit = num % 10
    sum = sum + digit ** 3
    num = num // 10

if original == sum:
    print("Armstrong Number")
else:
    print("Not Armstrong Number")