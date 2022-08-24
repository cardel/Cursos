import numpy as np

def insertionSort(A):
    cnt = 1 #Cuento la salida del for
    for j in range(2,A.shape[0]+1):
        cnt += 1 #Cuenta la entrada del for
        key = A[j-1]
        cnt += 1 #Cuento key
        i = j-1
        cnt +=1 #Cuento i = ...
        cnt +=1 #Cuento salida
        while i>0 and A[i-1] > key:
            cnt +=1 #Cuento verificación
            A[i+1-1] = A[i-1]
            cnt +=1 #Cuento actualización
            i-=1
            cnt +=1 #Cuento i-=1
        
        A[i+1-1] = key
        cnt+=1
    return cnt

arreglo1 = np.array([1,4,2,3,5,3,1,2,1])
insertionSort(arreglo1)
print(arreglo1)        

arreglo2 = np.array([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31])
print(insertionSort(arreglo2),5*arreglo2.shape[0]-4)

arreglo3 = np.array([x for x in range(0,1000000)])
print(insertionSort(arreglo3),5*arreglo3.shape[0]-4)

arreglo4 = np.array([x for x in range(1000,-1,-1)])
print(insertionSort(arreglo4),1.5*arreglo4.shape[0]**2+3.5*arreglo4.shape[0]-4)

variable = 0
for i in range(0,100):
    arreglo5 = np.random.randint(0,10000,(1000))
    variable+=insertionSort(arreglo5)

variable/=100
print(variable,0.75*arreglo5.shape[0]**2+2.75*arreglo5.shape[0]-2.5)

