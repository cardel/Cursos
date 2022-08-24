import Heap
import numpy as np

arreglo = np.array([10,8,9,4,7,1,6,2,3])

monton = Heap.Heap()
monton.build_monticulo(arreglo)

print(monton.monticulo)

arreglo2 = np.array([5,7,10,1,4,6,8,2,9,12])
monton2 = Heap.Heap()
monton2.build_monticulo(arreglo2)
print(monton2.monticulo)

monton3 = Heap.Heap()
arreglo3 = np.array([5,7,10,1,4,6,8,2,9,12])
print(monton3.heap_sort(arreglo3))

monton4 = Heap.Heap()
arreglo4 = np.array([12,9,10,7,8,1])
print(monton4.heap_sort(arreglo4))

monton5 = Heap.Heap()
arreglo5 = np.array([5,7,10,1,4,6,8,2,9,12])
print(monton5.heap_sort(arreglo5))
