"""
Autor: Carlos A Delgado
Fecha: 12 de Mayo de 2022

Busqueda binaria

"""
import numpy as np
import math
def busqueda_binaria(A,p,r,valor):
    if p<r:
        q = math.floor((p+r)/2)
        x = A[p]

        if valor==A[q]:
            return True
        elif valor<A[q]:
            return busqueda_binaria(A,p,q,valor)
        else:
            return busqueda_binaria(A,q+1,r,valor)
    else:
        return A[p]==valor


arreglo = np.array([1,2,3,4,5,6,8,9,10,11,12,13,14,15,16,17,18])
print(busqueda_binaria(arreglo,0,arreglo.shape[0]-1,14))
print(busqueda_binaria(arreglo,0,arreglo.shape[0]-1,7))