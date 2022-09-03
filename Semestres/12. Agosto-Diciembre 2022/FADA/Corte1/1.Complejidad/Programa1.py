"""
Carlos A Delgado S
03 de Septiembre de 2022
"""
def programa1(n):
  i = 1
  cnt = 1 #Anterior
  cnt+=1 #Salida while
  while i<=n:
    cnt+=1 #Validos
    j = 1
    cnt+=1 #Anterior
    cnt+=1 #Salida while interno
    while j<=n:
      cnt+=1 #Entrada while interno
      pass
      cnt+=1 #Anterior
      j=j+1
      cnt+=1 #Anterior
    i=i+1
    cnt+=1 #Anterior
  return cnt

def formula(n):
  return 3*n+2*n**2+n*(n+1)+2

n_sizes = [10,20,50,100,200,500]

for n in n_sizes:
  print(n,programa1(n),formula(n))
