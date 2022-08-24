"""
Carlos A Delgado
21 de Abril de 2022
Ejemplo recurrencia: 2T(n/2)+4n
"""
import math
def T(n):
    if n==1:
        return 1
    else:
        return 2*T(n/2)+4*n


def f(n):
    return (math.log2(n))*4*n+n

lista = [2**x for x in range(0,10)]

for n in lista:
    print(n,T(n),f(n))