import math
def algoritmo3(n):
    cnt = 1 #Cuento la salida del for
    for i in range(100,3*n):
        cnt+=1 #Las verificaciones del for del
        #print(i)
        cnt+=1 #Instrucción print(i)

    return cnt, 2*(3*n-300/3)+1

for n in [333,999,666]:
    print(algoritmo3(n))


def algoritmo4(n):
    cnt = 1 #Salida del for
    lista = []
    for i in range(0,int(math.log(n)/math.log(10))+1):
        lista.append(10**i)

    for k in lista:
        cnt+=1 #Verificación del for
        #print(i)
        cnt+=1 #print(i)
    return cnt,2*(math.log(n)/math.log(10))+1

for n in [1000,1000000]:
    print(algoritmo4(n))