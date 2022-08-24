import numpy as np
import time
import matplotlib.pyplot as plt

def fibDinamico(n):
    c = np.zeros(n+1)

    for i in range(0,n+1):
        if i==0:
            c[i] = 0
        elif i==1:
            c[i] = 1
        else:
            c[i] = c[i-1]+c[i-2]

    return c[n]

def fibRec(n):
    if n==0:
        return 0
    elif n==1:
        return 1
    else:
        return fibRec(n-1)+fibRec(n-2)

tiempoR = []
tiempoD = []
size = [5,10,15,20,25,30]
for i in size:
    iniR = time.time()*1000
    fibRec(i)
    finR= time.time()*1000
    tiempoR.append(finR-iniR)

    iniD = time.time()*1000
    fibDinamico(i)
    finD= time.time()*1000
    tiempoD.append(finD-iniD)

plt.figure(dpi=300)
plt.plot(size,tiempoR,"red",label="Alg Recursivo")
plt.plot(size,tiempoD,"blue",label="Algoritmo Dinámico")
plt.legend()
plt.show()
