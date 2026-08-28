# Constructor and Instance Method
class Student:
    def __init__(self, name):
        self.name = name

    def display(self):
        print("Name:", self.name)

s = Student("Chinmay Sunkavalli")
s.display()