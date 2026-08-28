# Using constructor and instance attributes

class Student:
    def __init__(self):
        self.name = "Raju"
        self.age = 23

        print("My name is:", self.name)
        print("My age is:", self.age)

s1 = Student()

print("My name outside class is:", s1.name)
print("My age outside class is:", s1.age)