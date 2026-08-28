
class Student:
    def __init__(self, name, age):
        self.name = name
        self._age = age
        self.__marks = 85

    def show_details(self):
        print("Name:", self.name)
        print("Age:", self._age)
        print("Marks:", self.__marks)


s = Student("Chinmay", 20)

s.show_details()