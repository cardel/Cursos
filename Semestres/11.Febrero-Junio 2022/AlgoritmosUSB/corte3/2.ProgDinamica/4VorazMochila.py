"""
Carlos A Delgado
26 de Mayo 2022
Voraz Mochila
"""
import numpy as np

def greedy_backpack(weight,bias,capacity):
    sol = np.zeros(weight.shape[0])

    ponderacion = bias/weight

    ponderacion_ordenada = np.argsort(ponderacion)[::-1]
    c = capacity #Capacidad
    for elm in ponderacion_ordenada:
        if c>=weight[elm]: #Cabe
            sol[elm] = 1
            c -= weight[elm] #Al llevarlo resto el peso a la capacidad del
        else:
            sol[elm] = 0
    return sol

g = np.array([3,2,1,4])
w = np.array([7,5,6,8])
c = 20

print(greedy_backpack(w,g,c))