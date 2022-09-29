""""
Carlos A Delgado
29 de Sep de 2022
T(n) = 2T(n/2)+n^2
"""

def T(n):
  if n == 1:
    return 5
  else:
    return 2*T(n/2)+n**2

#COndición: n es potencia de 2
def fml(n):
  return 5*n-2*n+2*n**2

lst = [2**x for x in range(0,10)]

for n in lst:
  print(n,T(n),fml(n))
