# Day 18 - Generators

# 1. Generator Function
def numbers():
    yield 1
    yield 2
    yield 3


gen = numbers()

print(next(gen))
print(next(gen))
print(next(gen))


# 2. Generator with Loop
def count_numbers(n):
    for i in range(1, n + 1):
        yield i


for number in count_numbers(5):
    print("Generated:", number)


# 3. Generator Expression
numbers = (x * x for x in range(1, 6))

for number in numbers:
    print("Square:", number)