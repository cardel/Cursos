"""
Carlos A Delgado
12 de Junio de 2022
Funciones de orden superior
"""

def operacion(a,b):
    return a**2+b**2

def operacionB(m,n):
    return m**3+n**3

def operar(f,x,y):
    return f(x,y)

resultado = operar(operacion,2,3)
print(resultado)
print(operar(operacionB,2,3))