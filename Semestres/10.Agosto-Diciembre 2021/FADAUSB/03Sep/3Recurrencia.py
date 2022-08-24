"""
Autor: Carlos A Delgado
Fecha: 03 de Septiembre de 2021
"""
import math
def recurrencia(n):
    if n==1:
        return 1
    else:
        return 2*recurrencia(n/2)+n

def formula(n):
    return n*(math.log2(n)+1)

lista = [2**n for n in range(0,20)]

for e in lista:
    print("RR ",recurrencia(e), " Formula ",formula(e))