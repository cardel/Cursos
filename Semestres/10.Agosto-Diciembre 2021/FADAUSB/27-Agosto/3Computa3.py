"""
Autor: Carlos A Delgado
Fecha: 27-Agosto-2021
"""

def computa3(N):
    A = 0
    i = 1
    while i<=N:
        B = 1
        j = 1
        while j<=3:
            B = B*i
            j+=1
        A = A+B
        i+=1
    return A

def formula(N):
    A = 0
    for k in range(1,N+2):
        A += (k-1)**3
    return A

print(computa3(10))
print(formula(10))

print(computa3(990))
print(formula(990))