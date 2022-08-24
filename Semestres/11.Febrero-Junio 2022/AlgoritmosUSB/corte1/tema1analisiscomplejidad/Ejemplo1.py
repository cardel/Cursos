
n = 100
def algoritmo1(n):
    cnt = 1 #Cuento la salida de una vez
    for i in range(4,n):
        cnt+=1 #Verificaciones del for
        #print("Hola")
        cnt+=1 #CUento el print
    return cnt,2*n-7

for n in [10,100,200,500,1000]:
    print(algoritmo1(n))


def algoritmo2(n):
    cnt = 1 #Cuenta la salida
    for i in range(20,n+1,5):
        cnt+=1

    return cnt,(n-20)/5+2

for n in [25,40,500,1000,10000]:
    print(algoritmo2(n))
