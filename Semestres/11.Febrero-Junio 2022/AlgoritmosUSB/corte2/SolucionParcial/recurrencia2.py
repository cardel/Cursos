import math
def T(n):
    if n==1:
        return 1
    else:
        return 3*T(n/6)+4

def f(n):
    return n**math.log(3,6)+2*(n**math.log(3,6)-1)

lista = [6**x for x in range(10)]

for n in lista:
    print(n,T(n),f(n))