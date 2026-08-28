# Using a class attribute
class Student:
    college_name = "Codegnan"

    def __init__(self):
        self.name = "Chinmay"
        self.age = 20

s1 = Student()

print("Name:", s1.name)
print("Age:", s1.age)
print("College:", Student.college_name)
print("College using object:", s1.college_name)