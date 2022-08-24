"""
Carlos A Delgado
27 de Mayo de 2022
Ejercicio de generación de arreglos
"""
import numpy as np
def generar_arreglo2D(n,m):
    sal = np.full((n,m),0) #np.zeros((n,m))
    for i in range(0,sal.shape[0]):
        for j in range(0,sal.shape[1]):
            sal[i][j] = j+1-i
    return sal

print(generar_arreglo2D(4,6))
print(generar_arreglo2D(8,7))