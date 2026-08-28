# Creating a class and objects

class Product:
    platform = "Flipkart"

    def display_product(self):
        print("Displaying Product Details")

laptop = Product()
mobile = Product()

print(laptop.platform)
laptop.display_product()