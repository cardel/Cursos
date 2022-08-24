"""
Autor: Carlos A Delgado
Fecha: 13 de mayo de 2022
"""

import numpy as np

def sumar_vecinos(arr):
    for j in range(1,arr.size):
        arr[j]+=arr[j-1]

    return arr

arreglo=np.array([2,4,6,8,10,12,14])
print(sumar_vecinos(arreglo))
#Imprimir [2,6,12,20,30,42,56]

print(sumar_vecinos(np.array([1,2,3,4,5,6])))
#Imprime [1,3,6,10,15,21]