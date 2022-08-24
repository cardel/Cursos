"""
Autor: Carlos A Delgado
Fecha: 27-Agosto-2021
Ejemplo de la raiz
"""

def raiz_cuadrada(X,delta):
    a = 1.0
    indice = 1
    while not(abs(a**2-X) <= delta): # abs(a**2-X) > delta
        print(indice,a)
        indice = indice+1
        a = (a+X/a)/2
        
    return a

print(raiz_cuadrada(100,0.0001))

k = raiz_cuadrada(171,0.0001)
print(k**2)