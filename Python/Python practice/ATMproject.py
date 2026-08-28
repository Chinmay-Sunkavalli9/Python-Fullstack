pin = "1234"
balance = 50000
attempts = 0
maxattempts = 3
transac = []
while True:
    userpin = input("Enter your pin: ")
    if userpin == pin:
        print("Pin accepted. You can now access your account.")
        break
    else:
        attempts += 1
        print("Incorrect pin, remaining attempts: ", maxattempts - attempts)
        if attempts >= maxattempts:
            print("Card is blocked due to limit exceeded...")
            exit()
print("Next you will see menu")
while True:
    print("-----Your Menu-----")
    print("Press-1 for Checking Balance")
    print("Press-2 for Deposit Money")
    print("Press-3 for Withdraw Money")
    print("Press-4 to see last 4 Transactions")
    print("Press5 for Exit")
    choice = int(input("Enter your choice: "))
    if choice == 1:
        print("Your total balance is: ", balance)
    elif choice == 2:
        amount = int(input("Enter amount to deposit: "))
        if amount > 0:
            balance += amount
            transac.append(f"Deposited: {amount}")
            if len(transac) > 5:
                transac.pop(0)
            print("Transaction successful. Your new balance is: ", balance)
        else:
            print("Please enter a valid amount to deposit.")
    elif choice == 3:
        amount = int(input("Enter amount to withdraw: "))
        if amount > 0 and amount<= balance:
            balance=balance-amount
            transac.append(f"Withdrawn: {amount}")
            if len(transac) > 5:
                transac.pop(0)
            print("Amount withdrawn successfully. Your new balance is: ", balance)
        else:
            print("Insufficient balance or invalid amount. Please try again.")
    elif choice == 4:
        if len(transac) != 0:
            for t in transac:
                print(t)
        else:
            print("No transactions happened.")
    elif choice == 5:
        break
    else:
        print("Invalid choice. Please try again.")
print("End of project...")
