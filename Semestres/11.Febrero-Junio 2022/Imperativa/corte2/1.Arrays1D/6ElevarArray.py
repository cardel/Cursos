"""
Carlos A Delgado
Viernes 13 de Mayo del 2022 del siglo XXI, del milenio 3
"""
import numpy as np


def elevar_arreglo(arr):
    for i in range(arr.shape[0]):
        arr[i] = arr[i]**2
    return arr

arreglo1 = np.array([1, 2, 3, 4, 5])
print(elevar_arreglo(arreglo1))

arreglo2 = np.array([1, 2, 3, 4, 5,6,7,8,9])
print(elevar_arreglo(arreglo2))