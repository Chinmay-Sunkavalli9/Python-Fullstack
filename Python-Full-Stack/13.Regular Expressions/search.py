#re.search() method is used to search for a pattern in a string

import re

text = "I am learning Python"

result = re.search(r"Python", text)

if result:
    print("Python found")
else:
    print("Python not found")