# Constructor with Instance Variables
class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age

s1 = Student("Chinmay", 20)
s2 = Student("Devi", 22)

print(s1.name, s1.age)
print(s2.name, s2.age)