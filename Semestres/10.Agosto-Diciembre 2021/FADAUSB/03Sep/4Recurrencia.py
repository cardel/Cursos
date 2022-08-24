"""
Autor: Carlos A Delgado
Fecha: 03 de Septiembre de 2021
"""
import math
def recurrencia(n):
    if n==1:
        return 1
    else:
        return recurrencia(n/2)+1

def formula(n):
    return math.log2(n)+1

lista = [2**n for n in range(0,20)]

for e in lista:
    print("n ",e," RR ",recurrencia(e)," F ",formula(e))

    print("n ",e," RR ",recurrencia(10)," F ",formula(10))