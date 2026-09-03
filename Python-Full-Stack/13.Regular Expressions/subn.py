#re.subn() method returns a tuple containing the new string and the number of replacements made.
import re

text = "Phone: 123-456-7890"

result = re.subn(r'\d', '#', text)

print(result)