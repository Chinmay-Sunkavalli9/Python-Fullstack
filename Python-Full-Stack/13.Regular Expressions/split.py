#re.split() is a function in the re module of Python that allows you to split a string into a list based on a specified pattern. In this case, the pattern used is r'\W+', which matches one or more non-word characters (anything that is not a letter, digit, or underscore).

import re

text = "apple,banana;orange-grape"

result = re.split(r'\W+', text)

print(result)