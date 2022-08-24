"""
Autor: Carlos A Delgado
Fecha: 12 de Mayo de 2022
Halla el máximo de un arreglo por divide y vencerás.
"""
import math
import numpy as np
import matplotlib.pyplot as plt
import time

def combinar(a,b):
    return a if a>b else b


def buscar_maximo(A,p,r):
    """
    A: arreglo
    p = posición inicial
    r = Posición final
    """
    if p<r:
        q = math.floor((p+r)/2)
        a = buscar_maximo(A,p,q) #Maximo encontrado entre A[p..q]
        b = buscar_maximo(A,q+1,r) #Maximo encontrado entre A[q+1..r]
        return combinar(a,b)
    else:
        return A[p]  #Esto ocurre cuando p = r

def buscar_maximo_iterativamente(A):
    maxi = A[0]
    for elemento in A:
        maxi = elemento if elemento>maxi else maxi
    
    return maxi

datos = [10,50,100,200,500,1000]
tiempo_iterativo = np.zeros(len(datos))
tiempo_divide = np.zeros(len(datos))
for exp in range(100):
    for i in range(len(datos)):
        n = datos[i]
        arreglo = np.random.randint(0,10*n,n)

        ini = time.time()
        buscar_maximo(arreglo,0,arreglo.shape[0]-1)
        fin = time.time() 
        tiempo_divide[i]+=(fin-ini)/len(datos)


        ini = time.time()
        buscar_maximo_iterativamente(arreglo)
        fin = time.time() 
        tiempo_iterativo[i]+=(fin-ini)/len(datos)
        


plt.figure()
plt.plot(datos,tiempo_iterativo,label="Iterativo")
plt.plot(datos,tiempo_divide,label="Divide y vencerás")
plt.legend()
plt.show()