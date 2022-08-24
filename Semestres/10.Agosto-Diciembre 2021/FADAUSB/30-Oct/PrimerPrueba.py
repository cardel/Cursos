import Heap
import numpy as np
monton = Heap.Heap(6)
monton.heap = np.array([4,14,7,2,8,1])
monton.heapfy(1)
print(monton.heap)

monton = Heap.Heap(6)
monton.heap = np.array([6,8,9,2,7,1])
monton.heapfy(1)
print(monton.heap)

monton = Heap.Heap(13)
monton.heap = np.array([10,15,12,8,7,7,8,6,7,2,6,3,4])
monton.heapfy(1)
print(monton.heap)
