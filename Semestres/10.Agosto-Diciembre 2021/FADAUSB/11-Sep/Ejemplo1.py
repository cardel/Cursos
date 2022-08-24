"""
Autor: Carlos A Delgado
Fecha: 11 de Sep de 2021
"""
import math
def recurrencia(n):
    if n==1:
        return 8
    else:
        return 7*recurrencia(n/6)+n+1

def formula(n):
    lg = math.log(7)/math.log(6)
    p1 = (n**lg -1)/6
    p2 = 6*n*(n**(lg-1)-1)
    p3 = 8*(n**lg)
    return p1+p2+p3

n = [6**x for x in range(0,12)]

for ni in n:
    print("n ",ni," RR ",recurrencia(ni)," Formula ",formula(ni))
