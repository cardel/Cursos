"""
Autor: Carlos A Delgado
Fecha: 04 de Sep de 2021
"""

def recurrrencia(n):
    if n==1:
        return 4
    else:
        return 8*recurrrencia(n/2)+n**2

def formula(n):
    return 5*n**3 - n**2

n = [2**x for x in range(0,30)]

for e in n:
    print("n ",e," RR ",recurrrencia(e)," Form ",formula(e))