import numpy as np
def insertion_sort(arreglo):
    for j in range(1,arreglo.shape[0]):
        valor = arreglo[j+1-1] #-1 es por posición del arreglo
        k = j
        while k>0 and valor < arreglo[k-1]:
            arreglo[k] = arreglo[k-1]    
            k-=1
        arreglo[k] = valor
            
        

arreglo1 = np.array([3,8,1,4,6,9,1,2])
insertion_sort(arreglo1)
print(arreglo1)