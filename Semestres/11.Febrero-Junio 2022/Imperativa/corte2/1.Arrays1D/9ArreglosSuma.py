"""
Carlos A Delgado
27 de Mayo de 2022
Suma de dos arreglos
"""
import numpy as np
def sumar_arreglo(arr1,arr2):
    if arr1.shape[0] == arr2.shape[0]:
        sal = np.zeros(arr1.shape[0])

        for i in range(sal.shape[0]):
            sal[i] = arr1[i]+arr2[i]

        return sal
    else:
        return "Error, el tamaño no es el mismo"

res = sumar_arreglo(
	np.array([1,2,3,4,5]),
	np.array([2,3,4,5,6])
)
print(res)