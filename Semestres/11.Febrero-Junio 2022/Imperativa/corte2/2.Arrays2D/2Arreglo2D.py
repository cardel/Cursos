"""
Carlos A Delgado
27 de Mayo de 2022
Ejemplo de llenar un arreglo 2D con valores
"""
import numpy as np
def crear_arreglo2D(n,m):
    """
    Esta función recibe dos números entero n (filas) y m (columnas)
    Va a generar un arreglo 2D de tamaño n por m, cuyas filas tiene
    el valor 1 en la primera, 2 en la segunda y así hasta n en la ultima
    """
    arr = np.zeros((n,m))

    for i in range(arr.shape[0]):
        for j in range(arr.shape[1]):
            arr[i,j] = i+1
    
    return arr

print(crear_arreglo2D(4,5))
print(crear_arreglo2D(8,7))