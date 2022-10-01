""""
Carlos A Delgado
01 de Oct de 2022
"""
import math
import matplotlib.pyplot as plt
def T(n):
  if n<=1:
    return 1
  else:
    return T(math.floor(n/3))+T(math.floor(2*n/3))+n


def O(n):
  return 8*n

def Omega(n):
  return math.pow(n,0.25)

lista = [1,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80]
listaO = list(map(lambda x: O(x), lista))
listaOmega = list(map(lambda x: Omega(x),lista))
listaT = list(map(lambda x: T(x),lista))

plt.figure(dpi=200)
plt.plot(lista,listaO,label=r"$O(n)$")
plt.plot(lista,listaT,label=r"$T(n)$")
plt.plot(lista,listaOmega,label=r"$\Omega(n^{0.25})$")
plt.legend()
plt.savefig("grafica.png")
