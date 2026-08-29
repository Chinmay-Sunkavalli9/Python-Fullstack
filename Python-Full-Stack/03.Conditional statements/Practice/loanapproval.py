credit_score=int(input("Enter your credit score:"))
monthly_income=int(input("Enter Monthly income:"))
existing_liablities=int(input("Enter existing liablities:"))

if monthly_income >= 50000 and existing_liablities <=20000:
    if credit_score >=750 :
        print("Approved")
    elif credit_score > 650 < 750:
        print("Conditional eligibility")
    else:
        print("Rejected")
else:
    print("Rejected")


        