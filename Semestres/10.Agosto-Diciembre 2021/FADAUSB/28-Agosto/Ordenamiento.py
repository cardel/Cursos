"""
Autor: Carlos A Delgado
Fecha: 28 de Agosto de 2021
"""

def BS(A,N):
    for i in range(0,N):
        for j in range(N-1,i-1,-1):
            if A[j] < A[i]:
                A[i],A[j] = A[j],A[i]

arreglo = [4,3,2,1,0,10,12,-2]
BS(arreglo,8)
print(arreglo)