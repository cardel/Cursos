import QuickSort
import numpy as np

arreglo = np.array([6,1,5,8,9,4,7,7])

QuickSort.QuickSort(arreglo, 0,arreglo.shape[0]-1)

print(arreglo)

arreglo2 = np.array([10,1,9,3,2,8,3,7])

QuickSort.QuickSort(arreglo2, 0,arreglo2.shape[0]-1)

print(arreglo2)

arreglo3 = np.array([10,1,9,3,2,8,3,7,10,23,12,23,12,23,3,3,1232,312,3])
QuickSort.QuickSort(arreglo3, 0,arreglo3.shape[0]-1)
print(arreglo3)