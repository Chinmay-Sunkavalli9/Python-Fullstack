# Using class method and static method
class Product:
    delivery_charge = 40

    @classmethod
    def show_delivery_charge(cls):
        print("Delivery Charge:", cls.delivery_charge)

    @staticmethod
    def free_delivery(price):
        return price >= 500

Product.show_delivery_charge()

print(Product.free_delivery(700))
print(Product.free_delivery(300))