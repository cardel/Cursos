"""
Carlos A Delgado
27 de Mayo de 2022
Este programa recibe un arreglo y retorna un mensaje con su mínimo y máximo
"""
import numpy as np

def obtener_min_max(arr):
    """
    Esta función recibe un arreglo de enteros
    Retorna un mensaje "El número menor es {minimo} y el número mayor es {maximo}"
    """
    minimo = arr[0]
    maximo = arr[0]
    for i in range(0,arr.size):
        if arr[i] < minimo:
            minimo = arr[i]
        if arr[i] > maximo:
            maximo = arr[i]

    return f"El número menor es {minimo} y el número mayor es {maximo}"

sal = obtener_min_max(np.array([1,4,9,0,2,3,6,18,23,1,5,6]))
print(sal)