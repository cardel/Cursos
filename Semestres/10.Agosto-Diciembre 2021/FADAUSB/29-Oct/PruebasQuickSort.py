import QuickSort
import numpy as np

arreglo = np.array([6,1,5,8,9,4,7,7])

q = QuickSort.Partition(arreglo, 0,arreglo.shape[0]-1)

print(q,arreglo)

arreglo2 = np.array([10,1,9,3,2,8,3,7])

QuickSort.Partition(arreglo2, 0,arreglo2.shape[0]-1)

print(q,arreglo2)
