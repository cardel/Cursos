"""
Carlos A Delgado
03 de Septiembre de 2022
"""
def programa4(n):
  i = 1
  cnt = 1
  cnt+=1
  while i<=n:
    cnt+=1
    k=i
    cnt+=1
    cnt+=1
    while k<=n:
      cnt+=1
      k+=2
      #cnt+=1
    #cnt+=1
    i=i+2
  return cnt

def formula(n):
  a = (n+1)/2
  b = (n+3)/2
  return 1+4*b-3+a*b-a*(a+1)/2-a
  
n_sizes=[11,13,15,19,41,39]

for n in n_sizes:
  print(n,formula(n),programa4(n))
