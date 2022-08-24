"""
Autor: Carlos A Delgado
Fecha: 12 de Mayo de 2022
Halla el máximo de un arreglo por divide y vencerás.
"""
import math
import numpy as np

def combinar(a,b):
    return a if a>b else b


def buscar_maximo(A,p,r):
    """
    A: arreglo
    p = posición inicial
    r = Posición final
    """
    if p<r:
        q = math.floor((p+r)/2)
        a = buscar_maximo(A,p,q) #Maximo encontrado entre A[p..q]
        b = buscar_maximo(A,q+1,r) #Maximo encontrado entre A[q+1..r]
        return combinar(a,b)
    else:
        return A[p]  #Esto ocurre cuando p = r

arreglo = np.array([0,3,12,23,2312,36,24,3232,232])
print(buscar_maximo(arreglo,0,arreglo.shape[0]-1))