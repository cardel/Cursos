def T(n):
    if n==1:
        return 1
    else:
        return 4*T(n/2)+2*n

def f(n):
    return 3*n**2-2*n

lista = [2**x for x in range(0,10)]

for n in lista:
    print(n,T(n),f(n))