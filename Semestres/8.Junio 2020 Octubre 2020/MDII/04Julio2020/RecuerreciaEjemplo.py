import math

def an(n):
  if n==0:
    return 2
  if n==1:
    return 7
  return an(n-1)+2*an(n-2)


def solucion(n):
  return 3*math.pow(2,n)-math.pow(-1,n)

for i in range(0,20):
  print("R.R ",an(i)," Solución: ",solucion(i))
