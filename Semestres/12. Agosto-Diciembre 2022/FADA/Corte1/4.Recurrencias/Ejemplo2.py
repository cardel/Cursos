"""
Carlos A Delgado
29 de Sep de 2022
Ejemplo T(n) = 4 T(n/3)+n+1
"""
import math
def T(n):
  if n==1:
    return 1
  else:
    return 4*T(n/3)+n+1

def fml(n):
  return n**math.log(4,3)+3*n*n**math.log(4/3,3)-3*n+(n**math.log(4,3)-1)/3


lista = [3**x for x in range(0,10)]

for n in lista:
  print(n,T(n),fml(n))
