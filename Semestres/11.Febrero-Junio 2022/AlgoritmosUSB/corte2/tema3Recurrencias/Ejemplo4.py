import math

def T(n):
    if n==1:
        return 1
    else:
        return 3*T(n/2)+3*n

def f(n):
    a = 3*n
    b = math.pow(3/2,math.log2(n))-1
    c = a*b/((3/2)-1)
    #7 3^(log(n)/log(2)) - 6 n
    return 7*math.pow(3,math.log(n)/math.log(2))-6*n


lista = [2**x for x in range(0,10)]

for n in lista:
    print(n,T(n),f(n))