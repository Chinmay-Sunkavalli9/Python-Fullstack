# Hierarchical Inheritance
class Employee:
    def login(self):
        print("Employee logged in")

class Developer(Employee):
    def code(self):
        print("Developer is coding")

class Tester(Employee):
    def test(self):
        print("Tester is testing")

dev = Developer()
test = Tester()
dev.login()
dev.code()
test.login()
test.test()