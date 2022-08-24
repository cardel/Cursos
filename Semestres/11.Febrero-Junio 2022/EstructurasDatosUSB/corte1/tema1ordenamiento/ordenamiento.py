import numpy as np
import matplotlib.pyplot as plt
import time
def ordenar_ingenuo(arreglo):
    for i in range(0,arreglo.shape[0]):
        for j in range(i+1,arreglo.shape[0]):
            if arreglo[j]<arreglo[i]:
                arreglo[i],arreglo[j] = arreglo[j],arreglo[i]


def insertion_sort(arreglo):
    for j in range(2, arreglo.shape[0]+1):
        key = arreglo[j-1]
        i = j-1
        while i>0 and arreglo[i-1]>key:
            arreglo[i] = arreglo[i-1]
            i = i-1
        arreglo[i] = key 

def selectionSort(arreglo):
    for i in range(0,arreglo.shape[0]):
        posMenor = i
        valorMenor = arreglo[i]
        for j in range(i+1,arreglo.shape[0]):
            if arreglo[j]<valorMenor:
                posMenor = j
                valorMenor = arreglo[j]
        arreglo[i],arreglo[posMenor] = arreglo[posMenor],arreglo[i]



def ordenamiento_burbuja(arreglo):
    for k in range(0,arreglo.shape[0]): #Recortar la ultima posición
        for i in range(0,arreglo.shape[0]-1-k): #-1 desborde, -k porque en cada iteración tengo el ultimo elemento ordenado
            if arreglo[i]>arreglo[i+1]:
                arreglo[i],arreglo[i+1] = arreglo[i+1],arreglo[i]
    


tiemposOI = []
tiemposIS = []
tiemposSC = []
tiemposOB = []
tamanios = [50,100,150,200,250,300,350]
for n in tamanios:
    tIn = 0
    tIs = 0
    tSc = 0
    tOb = 0
    experimentos = 100
    for i in range(0,experimentos):

        arregloX = np.random.randint(0,100000,(n))
        ini = time.time()
        ordenar_ingenuo(arregloX)
        fin = time.time()
        tIn += (fin-ini)

        arregloX = np.random.randint(0,100000,(n))
        ini = time.time()
        insertion_sort(arregloX)
        fin = time.time()
        tIs+=(fin-ini)

        arregloX = np.random.randint(0,100000,(n))
        ini = time.time()
        selectionSort(arregloX)
        fin = time.time()
        tSc+=(fin-ini)

        arregloX = np.random.randint(0,100000,(n))
        ini = time.time()
        ordenamiento_burbuja(arregloX)
        fin = time.time()
        tOb+=(fin-ini)


    tiemposOI.append(tIn/experimentos)
    tiemposIS.append(tIs/experimentos)
    tiemposSC.append(tSc/experimentos)
    tiemposOB.append(tOb/experimentos)

fig = plt.figure(dpi=300)
plt.plot(tamanios,tiemposOI,"r-", label="Algoritmo ingenuo")
plt.plot(tamanios,tiemposIS,"b-",label="Insertion Sort")
plt.plot(tamanios,tiemposSC,"g-",label="Selection Sort")
plt.plot(tamanios,tiemposOB,"y-",label="Bubble Sort")

plt.xlabel("Tamaño")
plt.ylabel("Segundos")
plt.legend()
plt.tight_layout()
plt.show()