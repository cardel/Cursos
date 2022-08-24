import numpy as np

def ordenamiento_burbuja(arreglo):
    for k in range(0,arreglo.shape[0]): #Recortar la ultima posición
        for i in range(0,arreglo.shape[0]-1-k): #-1 desborde, -k porque en cada iteración tengo el ultimo elemento ordenado
            if arreglo[i]>arreglo[i+1]:
                arreglo[i],arreglo[i+1] = arreglo[i+1],arreglo[i]
    

arreglo1 = np.array([3,8,1,4,6,9,1,2])
ordenamiento_burbuja(arreglo1)
print(arreglo1)