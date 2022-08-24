import math

def recurrencia(n):
    if n==1:
        return 1
    else:
        return 8*recurrencia(n/4)+2*n**2

def formula(n):
    return 2*n**2+n**2*(0.5**((math.log2(n)/math.log2(4))-1)-1)/(-0.5)+n**(math.log2(8)/math.log2(4))


n = [4**i for i in range(0,10)]

for valor in n:
        print("n "+str(valor)+" RR "+str(recurrencia(valor))+ " Formula " + str(formula(valor)))