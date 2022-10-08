"""
Carlos A Delgado
08 de Oct de 2022
Comprobación por su sustitucion de la ecuación 2T(n/2)+n^2
"""
import matplotlib.pyplot as plt
def T(n):
  if n==1:
    return 1
  else:
    return 2*T(n/2)+n**2

def O(n):
  return 9*n**2

def Omega(n):
  return (3/2.0)*n**2

lst = [2**x for x in range(0,15)]
tn = [T(n) for n in lst]
on = [O(n) for n in lst]
omegan = [Omega(n) for n in lst]

plt.figure(dpi=200)
plt.plot(lst,tn,label="T(n)")
plt.plot(lst,on,label=r"$O(n^2)$")
plt.plot(lst,omegan,label=r"$\Omega(n)$")
plt.legend()
plt.show()
