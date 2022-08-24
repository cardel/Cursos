import math

def recurrencia(n):
    if n==1:
        return 8
    else:
        return 4*recurrencia(n/4)+n+1
    
def formula(n):
    return n*(math.log(n)/math.log(4))+(n/3)-(1/3)+8*n

n = [4**x for x in range(0,10)]

for ni in n:
    print(ni," RR ",recurrencia(ni)," F ",formula(ni))