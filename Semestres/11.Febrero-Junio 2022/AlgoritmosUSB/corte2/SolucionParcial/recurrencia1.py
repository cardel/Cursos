import math
def T(n):
    if n==1:
        return 1
    else:
        return 4*T(n/8)+n

def f(n):
    return n**(math.log(4,8))-2*n*(n**(math.log(0.5,8))-1)


lista = [8**x for x in range(10)]

for n in lista:
    print(n,f(n),T(n))