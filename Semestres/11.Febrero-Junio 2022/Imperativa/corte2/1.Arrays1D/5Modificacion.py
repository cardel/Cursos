"""
Carlos A Delgado S
13 de Mayo de 2022
"""
import numpy as np
arreglo = np.array([2,3,4,9,10,12])

arreglo[1] = 10
print(arreglo)

arreglo = np.insert(arreglo,arreglo.size,100)
print(arreglo)

arreglo = np.insert(arreglo,0,10000)
print(arreglo)