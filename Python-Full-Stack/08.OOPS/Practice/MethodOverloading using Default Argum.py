# Method Overloading using Default Arguments
class Greet:
    def hello(self, name=None):
        if name:
            print("Hello", name)
        else:
            print("Hello")

g = Greet()

g.hello()
g.hello("Chinmay")