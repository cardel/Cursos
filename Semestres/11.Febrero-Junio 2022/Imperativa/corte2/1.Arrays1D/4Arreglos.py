import numpy as np

arreglo = np.array([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19])

def suma_elementos(arreglito):
    acc = 0
    for i in range(arreglito.shape[0]):
        acc+=arreglito[i]

    return acc

def suma_elementos_cuadrado(arr):
    acc = 0
    for elm in arr:
        acc+=elm**2
    
    return acc

def suma_elemementos_pares(arr):
    acc = 0
    for i in range(arr.size):
        if arr[i] % 2 == 0:
            acc+=arr[i]
    return acc

def maximum(arreglo):
    maximo = arreglo[0]
    for i in range(arreglo.shape[0]):
        if arreglo[i]>maximo:
            maximo=arreglo[i]

    return maximo

print(suma_elementos(arreglo))
print(suma_elementos_cuadrado(arreglo))
print(suma_elemementos_pares(arreglo))
print(maximum(arreglo))