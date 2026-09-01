# Class Method
class Student:
    college = "ABC College"

    @classmethod
    def show_college(cls):
        print("College:", cls.college)

Student.show_college()