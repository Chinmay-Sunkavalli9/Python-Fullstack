# Single Inheritance
class Vehicle:
    def start(self):
        print("Vehicle is starting")

class Car(Vehicle):
    def drive(self):
        print("Car is driving")

c = Car()

c.start()
c.drive()