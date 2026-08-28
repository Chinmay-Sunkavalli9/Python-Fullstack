# Using super()
class Person:
    def __init__(self, name):
        self.name = name

class Student(Person):
    def __init__(self, name, course):
        super().__init__(name)
        self.course = course

s = Student("Chinmay", "Python")
print("Name:", s.name)
print("Course:", s.course)