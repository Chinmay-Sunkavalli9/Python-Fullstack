import re

pattern = r'^[a-zA-Z0-9._%+-]+@gmail\.com$'

emails = [
    "example@gmail.com",
    "user.name@gmail.com",
    "user+123@gmail.com",
    "invalid-email@yahoo.com",
    "another-invalid@gmail.org"
]

for email in emails:
    if re.match(pattern, email):
        print(f"{email} is a valid Gmail address")
    else:
        print(f"{email} is NOT a valid Gmail address")