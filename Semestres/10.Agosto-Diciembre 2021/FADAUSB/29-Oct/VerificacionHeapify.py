import Heap
import numpy as np

monton = Heap.Heap(10)

monton.monticulo = np.array([4,14,7,2,8,1,None,None,None,None])
print("Ejemplo 1")
print(monton.monticulo)
monton.heapify(1)
print(monton.monticulo)

monton.monticulo = np.array([6,8,9,2,7,1,None,None,None,None])
print("Ejemplo 2")
print(monton.monticulo)
monton.heapify(1)
print(monton.monticulo)

monton = Heap.Heap(13)
monton.monticulo = np.array([10,15,12,8,7,7,8,6,7,2,6,3,4])
print("Ejemplo 3")
print(monton.monticulo)
monton.heapify(1)
print(monton.monticulo)


