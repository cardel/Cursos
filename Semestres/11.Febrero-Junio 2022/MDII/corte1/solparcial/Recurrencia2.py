import math
def T(n):
    if n==1:
        return 3
    elif n==3:
        return 9
    else:
        return 6*T(n/3)-9*T(n/9)+2*n

def f(n):
    return 3*n-math.log(n,3)*n+n*(math.log(n,3))**2


lista = [3**x for x in range(0,10)]

for n in lista:
    print(n,f(n),T(n))