import random
target=random.randint(1,10)
while True:
  num=int(input("Enter a num:"))
  if num == target:
    print("you got it")
    break
  elif num>target:
    print("Too high")
  else:
    print("Too low")
  