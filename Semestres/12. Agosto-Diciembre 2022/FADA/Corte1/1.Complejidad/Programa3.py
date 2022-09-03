"""
Carlos A Delgado S
03 de Septiembre de 2022
"""
def programa3(n):
  cnt = 0
  i = 1
  cnt+=1 #Anterior
  cnt+=1 #Salida while
  while i<=n:
    cnt+=1 #Entrada al while
    k = i
    cnt+=1 #Anterior
    cnt+=1 #Salida del primer while
    while k<=n:
      cnt+=1 #Entrada del while
      k=k+1
      cnt+=1 #Anterior
    k = 1
    cnt+=1 #Anterior
    cnt+=1 #Salida del segundo while
    while k<=i:
      cnt+=1 #Entrada while
      k=k+1
      cnt+=1 #Anterior
    i=i+1
    cnt+=1 #Anterior
  return cnt

def formula(n):
  return 2+6*n+2*n*(n+1)

n_sizes= [10,20,30,40,50,100,200,500]

for n in n_sizes:
  print(n,formula(n),programa3(n))

