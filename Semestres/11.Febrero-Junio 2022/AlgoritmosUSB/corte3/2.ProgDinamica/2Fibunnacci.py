"""
Carlos A Delgado
Serie de Fibunnaci recursivo vs dinamico
"""
import time
import numpy as np
def fibR(n):
    if n == 0:
        return 1
    elif n==1:
        return 1
    else:
        return fibR(n-1)+fibR(n-2)

def fibDinamico(n):
    c = np.zeros(n+1)

    for i in range(c.shape[0]):
        if i==0 or i==1:
            c[i]=1
        else:
            c[i] = c[i-1]+c[i-2]
        
    return c,c[n]

pruebas = [10,20,30,40]
for n in pruebas:
    iniR = time.time()
    a = fibR(n)
    finR = time.time()
    iniD = time.time() 
    b = fibDinamico(n)
    finD = time.time()
    print("n ",n," recursivo ",finR-iniR, " dinamico", finD-iniD)