class BankAccount:
    def __init__(self, name, balance):
        self.name = name
        self.__balance = balance

    def show_balance(self):
        print("Balance:", self.__balance)

    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            print("Amount deposited:", amount)
        else:
            print("Invalid amount")

account = BankAccount("Chinmayi", 5000)
account.show_balance()
account.deposit(2000)
account.show_balance()