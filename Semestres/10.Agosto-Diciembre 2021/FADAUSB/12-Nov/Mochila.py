#https://www.wextensible.com/temas/programacion-dinamica/mochila.html
import numpy as np
#Solución dinamica
def mochilaD(M,w,b):
    BMAX = np.zeros((M+1,w.shape[0]))

    for i in range(0,M+1):
        for j in range(0,w.shape[0]):
            if i==0: #Mochila de capacidad 0
                BMAX[i,j]=0
            elif j == 0 and i>=w[0]:
                BMAX[i,j] = b[0]
            elif i-w[j]>=0: #Si el elemento cabe
                BMAX[i,j] = max(
                    BMAX[i,j-1], #Decidi no llevarlo
                    BMAX[i-w[j],j-1]+b[j] #Decidi llevarlo
                )
            else: #Si el elemento no me cabe
                BMAX[i,j] = BMAX[i,j-1] #No llevo el elemento

    #Estructuramos la solución
    col = w.shape[0] - 1
    C = M
    sol = []
    for elm in range(col,-1,-1):
        if elm==0 and BMAX[C,elm] == 0: #No llevamos el elemento
            sol.insert(0,0)
        elif elm==0 and BMAX[C,elm] == b[0]:
            sol.insert(0,1)
        elif C >= w[elm] and BMAX[C,elm] > BMAX[C,elm-1]: #Decidi llevarlo
            sol.insert(0,1)
            C -= w[elm]
        else:
            sol.insert(0,0)

    return BMAX,sol
#Solución voraz
def mochilaV(M,w,b):
    bw = np.divide(b,w)
    C = M
    sol = np.zeros(w.shape[0])
    ben = 0
    for i in range(0,w.shape[0]):
        elm = np.argmax(bw)
        bw[elm] = 0 #Borro el elemento
        if C-w[elm] >= 0: #Cabe
            sol[elm] = 1
            ben += b[elm]            
            C -= w[elm]
        else: #No cabe
            sol[elm] = 0
    return ben,sol

print(mochilaD(20,np.array([7,5,6,8]),np.array([3,2,1,4])))
print(mochilaV(20,np.array([7,5,6,8]),np.array([3,2,1,4])))

print(mochilaD(15,np.array([9,6,5]),np.array([38,40,24])))   
print(mochilaV(15,np.array([9,6,5]),np.array([38,40,24])))         
print(mochilaD(11,np.array([9,6,5]),np.array([38,40,24])))  
print(mochilaV(11,np.array([9,6,5]),np.array([38,40,24])))                  