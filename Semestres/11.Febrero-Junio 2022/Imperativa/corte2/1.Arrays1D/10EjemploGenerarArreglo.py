"""
Carlos A Delgado
27 de Mayo de 2022
Generar un arreglo de tamaño con los números entre 1 y 100
"""
import numpy as np
def generar_arreglo(n):
    arr = np.array([])
    for i in range(n):
        arr = np.insert(arr,arr.shape[0],i+1)

    return arr

print(generar_arreglo(100))