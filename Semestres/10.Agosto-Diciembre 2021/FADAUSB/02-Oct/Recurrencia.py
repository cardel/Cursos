import math

def recurrencia(n):
    if n==1:
        return 10
    else:
        return 4*recurrencia(n/3)+2*n
    
def formula(n):
    return 6*n*n**(math.log(4/3)/math.log(3))-6*n+10*n**(math.log(4)/math.log(3))

n = [3**x for x in range(0,10)]

for ni in n:
    print(ni," RR ",recurrencia(ni)," F ",formula(ni))