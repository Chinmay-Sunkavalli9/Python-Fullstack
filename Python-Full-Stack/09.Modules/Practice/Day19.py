# Day 19 - Modules in Python

# 1. Importing Modules
import math

print("Square root:", math.sqrt(25))
print("Factorial:", math.factorial(5))
print("Pi:", math.pi)


# 2. Importing Specific Functions
from math import sqrt, factorial

print("Square root:", sqrt(36))
print("Factorial:", factorial(4))


# 3. Importing Module using Alias
import math as m

print("Square root:", m.sqrt(49))
print("Pi:", m.pi)


# 4. Built-in Modules

import os
import sys
import platform
import json
import random
import collections
import itertools

print("Current Directory:", os.getcwd())
print("Python Version:", sys.version)
print("Operating System:", platform.system())

print("Random Number:", random.randint(1, 10))

data = {"name": "Chinmay", "course": "Python"}
print("JSON:", json.dumps(data))

print("Counter:", collections.Counter("python"))

print("Permutations:", list(itertools.permutations([1, 2, 3], 2)))


# 5. __name__ Variable

print("Module Name:", __name__)


# 6. if __name__ == "__main__"

if __name__ == "__main__":
    print("This file is executed directly")