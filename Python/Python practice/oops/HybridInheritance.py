# Hybrid Inheritance
class Person:
    def walk(self):
        print("Person can walk")
class Student(Person):
    def study(self):

        print("Student is studying")
class Athlete(Person):
    def run(self):

        print("Athlete is running")
class SportsStudent(Student, Athlete):
    def practice(self):
        print("Sports student is practicing")
s = SportsStudent()
s.walk()
s.study()
s.run()
s.practice()