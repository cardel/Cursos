"""
Carlos A Delgado
27 de Mayo de 2022
Función para generar un arreglo 2D de acuerdo a un valor de entrada
"""
import numpy as np
def generar_arreglo2D_s(n,m,s):
    sal = np.zeros((n,m)) #Genero la matriz
    for i in range(sal.shape[0]):
        for j in range(sal.shape[1]):
            sal[i][j] = (i+1)*s+j
    return sal

print(generar_arreglo2D_s(3,5,2))
print(generar_arreglo2D_s(8,7,2))