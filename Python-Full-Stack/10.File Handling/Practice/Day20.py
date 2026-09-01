# Day 20 - File Handling and File Operations

# 1. Opening and Closing a File

file = open("sample.txt", "w")
file.write("Hello Python")
file.close()

print("File created successfully")


# 2. Reading using read()

file = open("sample.txt", "r")
data = file.read()
print("Using read():")
print(data)
file.close()


# 3. Reading using readline()

file = open("sample.txt", "r")
print("Using readline():")
print(file.readline())
file.close()


# 4. Reading using readlines()

file = open("sample.txt", "r")
print("Using readlines():")
print(file.readlines())
file.close()


# 5. Writing Data

file = open("sample.txt", "w")
file.write("Python File Handling\n")
file.write("Learning read and write operations")
file.close()

print("Data written successfully")


# 6. Appending Data

file = open("sample.txt", "a")
file.write("\nThis line is appended.")
file.close()

print("Data appended successfully")


# 7. Using with open()

with open("sample.txt", "r") as file:
    data = file.read()
    print("Using with open():")
    print(data)


# 8. File Modes

# r  -> Read
# w  -> Write
# a  -> Append
# r+ -> Read and Write
# w+ -> Write and Read
# a+ -> Append and Read

print("File modes:")
print("r  - Read")
print("w  - Write")
print("a  - Append")
print("r+ - Read and Write")
print("w+ - Write and Read")
print("a+ - Append and Read")


# 9. Email Example using smtplib

import smtplib
from email.message import EmailMessage

email = EmailMessage()

email["Subject"] = "Python Practice"
email["From"] = "your_email@gmail.com"
email["To"] = "receiver@gmail.com"

email.set_content("This is a test email sent using Python.")

print("Email message created successfully")

# Do not put your real password directly in the code.
# SMTP sending can be done using a secure app password.

# with smtplib.SMTP_SSL("smtp.gmail.com", 465) as server:
#     server.login("your_email@gmail.com", "YOUR_APP_PASSWORD")
#     server.send_message(email)

print("Email example completed")
