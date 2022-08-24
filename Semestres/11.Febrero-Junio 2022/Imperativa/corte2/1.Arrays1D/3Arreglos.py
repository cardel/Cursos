import numpy as np

arreglo = np.array([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19])

def imprimir_pares_indice(arr):
    for i in range(arr.size):
        if arr[i] % 2 == 0:
            print(arr[i], end=" ")

def imprimir_pares_iterador(arr):
    for elm in arr:
        if elm % 2 == 0:
            print(elm, end=" ")
imprimir_pares_indice(arreglo)
print()
imprimir_pares_iterador(arreglo)


