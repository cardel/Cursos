"""
Carlos A Delgado
12 de Junio de 2022
Funciones de orden superior (que retornan otras funciones)
"""

def generar_funcion(op):
    if op=="+":
        def suma(x,y):
            return x+y
        return suma
    elif op=="-":
        def resta(x,y):
            return x-y
        return resta
    elif op=="*":
        def mul(x,y):
            return x*y
        return mul
    else:
        def diff(x,y):
            return abs(x-y)
        return diff

def operar(op,a,b):
    return generar_funcion(op)(a,b)

print(operar("+",1,2))
print(operar("*",8,2))
print(operar("-",10,20))