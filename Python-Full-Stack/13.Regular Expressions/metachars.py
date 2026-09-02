import re

text = "Python 123 is easy to learn. Email: test123@gmail.com"

#  Anchors
print(re.match(r"^Python", text))
print(re.search(r"learn\.$", text))


#  Meta Characters
print(re.findall(r"P.thon", text))
print(re.findall(r"Py*", text))
print(re.findall(r"Py+", text))
print(re.findall(r"Py?", text))
print(re.findall(r"\d{3}", text))
print(re.findall(r"[Pp]ython", text))
print(re.findall(r"Python|Java", text))
print(re.findall(r"(Python)", text))


