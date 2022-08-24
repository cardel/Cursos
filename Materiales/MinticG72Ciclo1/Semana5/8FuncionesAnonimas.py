"""
Carlos A Delgado
12 de Junio de 2022
Funciones de orden superior (que retornan otras funciones)
"""

def generar_funcion(op):
    if op=="+":
        suma = lambda x,y: x+y
        return suma
    elif op=="-":
        resta = lambda x,y: x-y
        return resta
    elif op=="*":
        mul = lambda x,y: x*y
        return mul
    else:
        diff = lambda x,y: abs(x-y)
        return diff

def operar(op,a,b):
    return generar_funcion(op)(a,b)

print(operar("+",1,2))
print(operar("*",8,2))
print(operar("-",10,20))