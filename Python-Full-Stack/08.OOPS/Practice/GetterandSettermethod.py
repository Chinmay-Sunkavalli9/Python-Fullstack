#Getter and Setter method
class Student:
    def __init__(self, name, marks):
        self.name = name
        self.__marks = marks

    def get_marks(self):
        print("Marks:", self.__marks)

    def set_marks(self, marks):
        if 0 <= marks <= 100:
            self.__marks = marks
            print("Marks updated successfully.")
        else:
            print("Invalid marks.")

s = Student("Chinmay", 80)
s.get_marks()
s.set_marks(90)
s.get_marks()