"""
Autor: Carlos A Delgado
Fecha: 28 de Agosto
"""

def cicloInterno(n):
    j = 0
    p = 4
    while j<=2*n:
        p += 2
        j += 1

    return p

def formula_interno(n):
    return 4*n+6

lista = [122,44,322,114,222]

for e in lista:
    print(cicloInterno(e),formula_interno(e))


def algoritmo(n):
    i = 0
    s = 3
    while i<=n:
        j = 0
        p = 4
        while j<=2*n:
            p +=2
            j +=1
        s += 2*p
        i+=2
    return s

def formula(n):
    return 3+((n+2)/2)*(8*n+12)

for i in range(0,20,2):
    print(i,algoritmo(i),formula(i))