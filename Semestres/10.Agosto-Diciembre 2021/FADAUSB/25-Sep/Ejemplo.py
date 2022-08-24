import math 

def recurrencia(n):
    if n==1:
        return 1
    else:
        return 4*recurrencia(n/4)+2*n+4

def formula(n):
    return 2*n * math.log2(n)/math.log2(4) + (4/3)*n-4/3+n


valoresN = [4**i for i in range(0,12)]
for valor in valoresN:
    print("n "+str(valor)+" RR "+str(recurrencia(valor))+ " Formula " + str(formula(valor)))