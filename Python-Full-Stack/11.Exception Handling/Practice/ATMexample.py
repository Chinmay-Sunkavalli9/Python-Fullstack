try:
    pin = int(input("Enter your 4-digit PIN: "))

    if pin == 1234:
        print("PIN accepted.")

        try:
            amount = float(input("Enter amount to withdraw: "))
            balance = 10000.0

            if amount > balance:
                raise ValueError("Insufficient balance.")
            else:
                print("Collect your cash: ₹", amount)

        except ValueError as ve:
            print("Transaction failed:", ve)

        else:
            print("Transaction completed successfully.")

    else:
        print("Incorrect PIN.")

except ValueError:
    print("PIN must be numeric!")