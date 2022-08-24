import numpy as np

def selectionSort(arreglo):
    for i in range(0,arreglo.shape[0]):
        posMenor = i
        valorMenor = arreglo[i]
        for j in range(i+1,arreglo.shape[0]):
            if arreglo[j]<valorMenor:
                posMenor = j
                valorMenor = arreglo[j]
        arreglo[i],arreglo[posMenor] = arreglo[posMenor],arreglo[i]


arreglo1 = np.array([3,8,1,4,6,9,1,2])
selectionSort(arreglo1)
print(arreglo1)