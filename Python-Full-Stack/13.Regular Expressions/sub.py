#re.sub() is a function in the re module that allows you to replace occurrences of a pattern in a string with a specified replacement. In this case, the pattern is r'\d', which matches any digit (0-9), and the replacement is '#'.
import re

text = "Phone: 123-456-7890"

result = re.sub(r'\d', '#', text)

print(result)