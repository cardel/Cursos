"""
Autor: Carlos A Delgado
Fecha: 11 de Sep 2021
"""
import math

def recurrencia(n):
    if n==1:
        return 10
    else:
        return 2*recurrencia(n/8)+n**2

def formula(n):
    p1 = (-32/31)*(n**2)*(n**(-math.log2(32)/math.log2(8)) - 1)
    p2 = 10*n**(math.log2(2)/math.log2(8))
    return p1+p2


n = [8**x for x in range(0,15)]

for ni in n:
    print("n ",ni," RR ",recurrencia(ni)," Formula ",formula(ni))