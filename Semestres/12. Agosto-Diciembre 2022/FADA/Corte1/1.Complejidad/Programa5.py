"""
Carlos A Delgado
08 de Septiembre de 2022
"""
import math
from tkinter import E
def programa5(n):
  i = 1
  cnt = 1
  cnt+=1
  while i<=n:
    cnt+=1
    k = i
    cnt+=1
    cnt+=1 #Salida
    while k<=n:
      cnt+=1
      k = k+2
      cnt+=1
    k=1
    cnt+=1
    cnt+=1 #Salida
    while k<=i:
      cnt+=1
      k = k+1
      cnt+=1
    i = 2*i
    cnt+=1
  return cnt

def formula(n):
  a = 6+4*math.log2(n)
  b= n/2*math.log2(n)+2*math.log2(n)+1/2-(2*n-1)/2
  c =n/2*math.log2(n)+math.log2(n)+1/2-(2*n-1)/2
  d =-1/2+(1/2)*(4*n-1)+math.log2(n)+1
  e =-1/2+(1/2)*(4*n-1)
  return a+b+c+d+e+(n/2)+1

n_sizes = [x**2 for x in range(2,8)]

for n in n_sizes:
  print(n,formula(n),programa5(n))
