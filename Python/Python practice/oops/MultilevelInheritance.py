# Multilevel Inheritance
class Person:
    def introduce(self):
        print("I am a person")

class Employee(Person):
    def work(self):
        print("I am working")

class Developer(Employee):
    def code(self):
        print("I am writing Python code")

d = Developer()

d.introduce()
d.work()
d.code()