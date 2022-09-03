"""
Carlos A Delgado
03 de Septiembre de 2022
"""
def programa2(n):
  s = 0
  cnt = 1 #Anterior
  i = 1
  cnt+=1 #Anterior
  cnt+=1 #Salida del while
  while i<=n:
    cnt+=1 #Entrada
    c = 0
    cnt+=1 #Anterior
    j = 1
    cnt+=1 #Anterior
    cnt+=1 #Salida while interno
    while j<=i:
      cnt+=1 #Entrada
      c = c+1
      cnt+=1 #Anterior
      j=j+1
      cnt+=1 #Anterior
    s = s+c
    cnt+=1 #Anterior
    i = i+1
    cnt+=1 #Anterior
  return cnt

def formula(n):
  return 6*n+3*n*(n+1)/2+3

n_sizes=[10,20,30,50,100,200,500]

for n in n_sizes:
  print(n,formula(n),programa2(n))
