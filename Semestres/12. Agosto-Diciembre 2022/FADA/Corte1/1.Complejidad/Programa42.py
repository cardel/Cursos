"""
Carlos A Delgado
03 de Septiembre de 2022
"""
def programa4(n):
  i = 1
  cnt = 1
  cnt+=1 #Salida de whie
  while i<=n:
    cnt+=1 #Entrada
    k=i
    cnt+=1
    cnt+=1 #Salida del primer while
    while k<=n:
      cnt+=1 #Entrada del primer while
      k+=2
      cnt+=1
    cnt+=1
    k=1
    cnt+=1 #Salida
    while k<=i:
      cnt+=1 #Entrada
      k+=1
      cnt+=1 #Anterior
    i=i+2
    cnt+=1
  return cnt

def formula(n):
  a = (n+1)/2
  x1= 2+4*a+a**2+n+1-a*(a+1)/2
  x2= a**2+n+1-a*(a+1)/2 - a
  x3=a*(a+1)
  x4=x3-a
  return x1+x2+x3+x4
  
n_sizes=[11,13,15,19,41,39]

for n in n_sizes:
  print(n,formula(n),programa4(n))
