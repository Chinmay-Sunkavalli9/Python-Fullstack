from abc import ABC, abstractmethod

class Person(ABC):

    def __init__(self, name, age):
        self._name = name
        self._age = age

    @abstractmethod
    def get_role(self):
        pass

    def get_basic_info(self):
        return f"Name: {self._name}, Age: {self._age}"

    def get_details(self):
        return f"{self.get_basic_info()}, Role: {self.get_role()}"


class Student(Person):

    def __init__(self, name, age, student_id, course):
        super().__init__(name, age)
        self._student_id = student_id
        self._course = course

    def get_role(self):
        return "Student"

    def get_student_info(self):
        return f"{self.get_details()}, Student ID: {self._student_id}, Course: {self._course}"


class Professor(Person):

    def __init__(self, name, age, emp_id, department):
        super().__init__(name, age)
        self._emp_id = emp_id
        self._department = department

    def get_role(self):
        return "Professor"

    def get_professor_info(self):
        return f"{self.get_details()}, Employee ID: {self._emp_id}, Department: {self._department}"


class AdminStaff(Person):

    def __init__(self, name, age, staff_id, designation):
        super().__init__(name, age)
        self._staff_id = staff_id
        self._designation = designation

    def get_role(self):
        return "Admin Staff"

    def get_staff_info(self):
        return f"{self.get_details()}, Staff ID: {self._staff_id}, Designation: {self._designation}"


class University:

    university_name = "Codegnan University"

    def __init__(self):
        self.__people = []

    def add_person(self, person: Person):
        self.__people.append(person)

    def display_all(self):
        if not self.__people:
            print("No people registered yet.")
        else:
            for person in self.__people:
                print(person.get_details())

    @classmethod
    def get_university_name(cls):
        return cls.university_name

    @staticmethod
    def welcome_message():
        return "Welcome to the University Management System"


print(University.welcome_message())
print("University:", University.get_university_name())

u = University()

while True:

    print("\n--- University Menu ---")
    print("1. Register Student")
    print("2. Register Professor")
    print("3. Register Admin Staff")
    print("4. Display All People")
    print("0. Exit")

    ch = input("Choose an option: ")

    if ch == "0":
        print("Thank you! Exiting the system.")
        break

    elif ch == "1":
        name = input("Enter Student Name: ")
        age = int(input("Enter Age: "))
        student_id = input("Enter Student ID: ")
        course = input("Enter Course Name: ")

        s = Student(name, age, student_id, course)
        u.add_person(s)

        print("Student Registered Successfully!")

    elif ch == "2":
        name = input("Enter Professor Name: ")
        age = int(input("Enter Age: "))
        emp_id = input("Enter Employee ID: ")
        dept = input("Enter Department: ")

        p = Professor(name, age, emp_id, dept)
        u.add_person(p)

        print("Professor Registered Successfully!")

    elif ch == "3":
        name = input("Enter Staff Name: ")
        age = int(input("Enter Age: "))
        staff_id = input("Enter Staff ID: ")
        designation = input("Enter Designation: ")

        a = AdminStaff(name, age, staff_id, designation)
        u.add_person(a)

        print("Admin Staff Registered Successfully!")

    elif ch == "4":
        print("\n--- List of Registered People ---")
        u.display_all()

    else:
        print("Invalid option. Please choose again.")