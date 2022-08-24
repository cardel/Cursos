import numpy as np

def programa1(mat1,mat2):
    i = 1
    cnt=1 #i = 1
    mat3 = np.zeros((mat1.shape[0],mat1.shape[1])) #Ignorar
    cnt+=1 #Salida while
    while i<=mat1.shape[0]:
        cnt+=1 #Ciclo while
        j = 1
        cnt+=1 #j=1
        cnt+=1 #Salida de while interno
        while j<=mat2.shape[0]:
            cnt+=1 #Ciclo interno
            mat3[i-1][j-1] = mat1[i-1,j-1]+mat2[i-1,j-1]
            cnt+=1 #Cuento la op
            j+=1
            cnt+=1 #Cuento el incr interno
        i += 1
        cnt+=1 #Cuento el incr ext
    return cnt

m1 = np.random.randint(0,10000000,(1000,1000))
m2 = np.random.randint(0,10000000,(1000,1000))
print(programa1(m1,m2),3*m1.shape[0]**2+4*m1.shape[0]+2)