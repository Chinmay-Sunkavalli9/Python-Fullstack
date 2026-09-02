import re

text = "Hello Python 123"

print(re.findall(r"[aeiou]", text))
print(re.findall(r"[0-9]", text))
print(re.findall(r"[A-Z]", text))
print(re.findall(r"[a-z]", text))