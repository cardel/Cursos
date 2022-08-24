import Heap
import numpy as np

arreglo1 = np.array([1,8,6,3,7,9,10,2,4])

monton = Heap.Heap(15)
monton.heapSort(arreglo1)
print(monton.heap)

arreglo2 = np.array([12,9,10,7,8,1])

monton2 = Heap.Heap(15)
monton2.heapSort(arreglo2)
print(monton2.heap)



arreglo3 = np.array([5,7,10,1,4,6,8,2,9,12])

monton3 = Heap.Heap(15)
monton3.heapSort(arreglo3)
print(monton3.heap)