# Day 12 - Advanced Loop Control Statements

# 1. For loop with else
for i in range(1, 6):
    print(i)
else:
    print("For loop completed")


# 2. While loop with else
i = 1

while i <= 5:
    print(i)
    i += 1
else:
    print("While loop completed")


# 3. Break statement
for i in range(1, 11):
    if i == 5:
        break
    print(i)


# 4. Continue statement
for i in range(1, 11):
    if i == 5:
        continue
    print(i)


# 5. Assert keyword
age = 22
assert age >= 18
print("Eligible")


# 6. Difference between break and continue
for i in range(1, 6):
    if i == 3:
        continue
    print("Continue:", i)

for i in range(1, 6):
    if i == 3:
        break
    print("Break:", i)