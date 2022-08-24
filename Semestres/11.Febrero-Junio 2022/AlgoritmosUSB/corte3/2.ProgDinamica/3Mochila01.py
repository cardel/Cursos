"""
Carlos A Delgado 
26-Mayo de 2022
Ejercicio Mochila 0/1
"""
import numpy as np
def backpack(weight,bias,capacity):
    b = np.zeros((capacity+1,weight.shape[0]))
    #Solución trivial
    for i in range(0,capacity+1):
        if i<weight[0]:
            b[i][0] = 0 #No me cabe
        else:
            b[i][0] = bias[0] #Me cabe

    #Solución recursiva
    for elm in range(1,weight.shape[0]): #Recorrer por columnas
        for cap in range(0,capacity+1):
            #Si el elmento no me cabe entonces no lo llevo
            if cap < weight[elm]:
                b[cap][elm] = b[cap][elm-1]
            else:
                b[cap][elm] = max( 
                    b[cap][elm-1], #No lo llevo
                    b[cap-weight[elm]][elm-1]+bias[elm] #Llevarlo
                )

    pos = [capacity,weight.shape[0]-1] # Posición final
    sol = np.zeros(weight.shape[0])

    while True:
        print(pos)
        i = pos[0] #Capacidad
        j = pos[1] #Elemento

        if j==0 and b[i][j]>0:
            sol[j] = 1 #Lo llevo
            break
        elif j==0 and b[i][j]==0:
            sol[j] = 0 #No lo llevo
            break
        elif b[i][j]==b[i][j-1]:
            sol[j]=0 #No lo llevo
            pos[1] -= 1 #Quito el elemento
        else:
            sol[j]=1 #Lo llevo
            pos[0]-=weight[j] #Quito el peso del elemento a la capacidad
            pos[1]-=1 #Quito el elemento
    
    return b,sol

g = np.array([3,2,1,4])
w = np.array([7,5,6,8])
c = 20

print(backpack(w,g,c))