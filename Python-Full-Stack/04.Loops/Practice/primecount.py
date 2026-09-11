prime_count=0
for n in range(1,101):
  count=0
  for i in range(1,n+1):
    if n % i == 0:
      count+=1
  if count == 2:
    prime_count+=1
print("count:",prime_count)
  