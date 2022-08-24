import math

def recursivo(n):
  if n == 1:
    return 6
  else:
    return 3*recursivo(2*n/3)+22

def formula(n):
  return 17*pow(n,math.log(3,3/2))-11

iterator = []
for i in range(0,20):
  iterator.append(pow(3/2,i))


for i in iterator:
  print(" i ",i," Recursiva ",recursivo(i)," formula ",formula(i))
