import numpy as np

coeff = np.array([1,-4,-8,16])
raices = np.roots(coeff)

# ax = b
a = np.array([
  [1,1,1],
  [raices[0],raices[1],raices[2]],
  [raices[0]**2,raices[1]**2,raices[2]**2]
])
b = np.array([10,15,22])

cte= np.linalg.solve(a,b)

def T(n):
  if n==0:
    return 10
  elif n==1:
    return 15
  elif n==2:
    return 22
  else:
    return 4*T(n-1)+8*T(n-2)-16*T(n-3)

def f(n):
  return cte[0]*(raices[0])**n+cte[1]*(raices[1])**n+cte[2]*(raices[2])**n 

for i in range(0,20):
  print(i,T(i),f(i))
