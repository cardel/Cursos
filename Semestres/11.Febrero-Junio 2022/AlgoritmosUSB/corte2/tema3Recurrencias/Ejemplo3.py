import math

def T(n):
    if n==1:
        return 1
    else:
        return 2*T(n/2)+n

def f(n):
    return n+n*math.log2(n)


lista = [2**i for i in range(0,20)]

for n in lista:
    print(n,T(n),f(n))