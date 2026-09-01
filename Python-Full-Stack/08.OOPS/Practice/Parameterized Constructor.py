# Parameterized Constructor
class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age
s1 = Student("Chinmay", 20)
print(s1.name)
print(s1.age)