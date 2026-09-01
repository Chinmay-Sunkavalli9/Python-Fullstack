from abc import ABC, abstractmethod
class Bank(ABC):

    @abstractmethod
    def loan_interest(self):
        pass

    def bank_services(self):
        print("Net Banking, ATM, Mobile App")


class SBI(Bank):

    def loan_interest(self):
        print("SBI interest rate is 8%")


bank = SBI()

bank.loan_interest()
bank.bank_services()