import numpy as np

def calcular_constantes():
    x = np.array([
        [1,1],
        [(5+41**0.5)/2,(5-41**0.5)/2]
    ])

    b = np.array([10+3/2-2/5+16,20+3/2-4/5+64])

    return np.linalg.solve(x,b)

def T(n):
    if n==0:
        return 10
    elif n==1:
        return 20
    else:
        return 5*T(n-1)+4*T(n-2)+12-(2**n)+8*4**n

def f(n,cte):
    raiz1 = ((5+41**0.5)/2)**n
    raiz2 = ((5-41**0.5)/2)**n   
    return  cte[0]*raiz1 + cte[1]*raiz2-3/2+(2/5)*2**n-(16)*4**n

cte = calcular_constantes()
print(cte)
for n in range(0,15):
    print(n,T(n),f(n,cte))

