

def T(n):
  if n==0:
    return 10
  elif n==1:
    return 20
  else:
    return 2*T(n-1)-T(n-2)+1+2**n

def f(n):
  return 6+(11/2)*n+(1/2)*n**2+4*2**n

for i in range(0,20):
  print(i,T(i),f(i))
