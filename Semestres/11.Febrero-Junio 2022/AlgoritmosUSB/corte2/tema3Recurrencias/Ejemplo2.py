def T(n):
    if n==1:
        return 1
    else:
        return 2*T(n/2)+1


def f(n):
    return 2*n-1

lista = [2**x for x in range(0,15)]

for n in lista:
    print(n,T(n),f(n))