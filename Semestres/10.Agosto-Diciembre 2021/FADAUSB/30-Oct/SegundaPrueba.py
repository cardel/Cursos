import Heap
import numpy as np

monton = Heap.Heap(10)
monton.build_heap(np.array([1,8,6,3,7,9,10,2,4]))
print(monton.heap)

monton = Heap.Heap(10)
monton.build_heap(np.array([5,7,10,1,4,6,8,2,9,12]))
print(monton.heap)
