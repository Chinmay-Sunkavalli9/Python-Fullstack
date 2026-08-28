#ATM abstraction
from abc import ABC, abstractmethod
class ATM(ABC):
    @abstractmethod
    def withdraw(self, amount):
        pass

    @abstractmethod
    def deposit(self, amount):
        pass

    def check_balance(self):
        print("Balance checking option")
class UserATM(ATM):
    def __init__(self):
        self.balance = 5000

    def withdraw(self, amount):
        if amount <= self.balance:
            self.balance -= amount
            print(amount, "withdrawn successfully.")
        else:
            print("Insufficient balance.")

    def deposit(self, amount):
        self.balance += amount
        print(amount, "deposited successfully.")

user = UserATM()
user.check_balance()
user.deposit(2000)
user.withdraw(1000)