"""
Autor: Carlos A Delgado
Fecha: 12 de Mayo de 2022

Busqueda binaria

"""
import numpy as np
import math
import time
import matplotlib.pyplot as plt
import random

def busqueda_binaria(A,p,r,valor):
    if p<r:
        q = math.floor((p+r)/2)
        x = A[p]

        if valor==A[q]:
            return True
        elif valor<A[q]:
            return busqueda_binaria(A,p,q,valor)
        else:
            return busqueda_binaria(A,q+1,r,valor)
    else:
        return A[p]==valor


def busqueda_iterativa(A,valor):
    for elemento in A:
        if elemento == valor:
            return True
    
    return False

datos = [10,50,100,200,500,1000,2000,5000]
tiempo_iterativo = np.zeros(len(datos))
tiempo_divide = np.zeros(len(datos))
for exp in range(100):
    for i in range(len(datos)):
        n = datos[i]
        arreglo = np.random.randint(0,10*n,n)
        arreglo = np.sort(arreglo) #Ordeno O(nlog(n))

        pos = random.randint(0,arreglo.shape[0]-1)
        valor = arreglo[pos]

        ini = time.time()
        
        busqueda_binaria(arreglo,0,arreglo.shape[0]-1,valor)
        fin = time.time() 
        tiempo_divide[i]+=(fin-ini)/len(datos)


        ini = time.time()
        busqueda_iterativa(arreglo,valor)
        fin = time.time() 
        tiempo_iterativo[i]+=(fin-ini)/len(datos)

plt.figure()
plt.plot(datos,tiempo_iterativo,label="Iterativo")
plt.plot(datos,tiempo_divide,label="Divide y vencerás")
plt.legend()
plt.show()