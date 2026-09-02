#Predefined Character Classes

import re

text = "Python 123 Full Stack"

print(re.findall(r"\d", text))
print(re.findall(r"\D", text))
print(re.findall(r"\s", text))
print(re.findall(r"\S", text))
print(re.findall(r"\w", text))
print(re.findall(r"\W", text))