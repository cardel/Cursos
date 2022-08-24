"""
Problema: Es una función que recibe un valor n y retorna la suma entre 1 y ese numero

Ejemplo n = 5, 1+2+3+4+5 = 15
Autor: Carlos A Delgado
Fecha: 08 de Abril de 2022
Descripción: Ejemplo de clase
"""

def funcion_for(n):
    salida = 0
    for i in range(1,n+1):
        salida = salida + i

    return salida

def funcion_while(n):
    i = 1
    salida = 0
    while i<=n:
        salida+=i
        i+=1
    return salida

print(funcion_for(5))
print(funcion_for(10))
print(funcion_for(100))
print(funcion_while(5))
print(funcion_while(10))
print(funcion_while(100))