"""
Carlos A Delgado
24 de Junio de 2022

Usando reduce hacer tres funciones:

-1 sumar_elementos
-2 sumar_cuadrados
-3 suma_especial

Suma especial si los elementos son pares suma su cuadrado y son impares suma su cubo

Ejemplo [1,2,3,4,5]

-1 ==> 15
-2 ==> 55
-3 ==> 173
"""
from functools import reduce
lista = [1,2,3,4,5]

def sumar_elementos_v1(lst):
    suma = 0
    for elm in lst:
        suma = suma + elm
    return suma

def sumar_elementos_v2(lst):
    return reduce(lambda suma,elm:suma+elm,lst,0)

print(sumar_elementos_v1(lista))
print(sumar_elementos_v2(lista))

def sumar_cuadrados_v1(lst):
    suma = 0
    for elm in lst:
        suma = suma + elm**2
    return suma


def sumar_cuadrados_v2(lst):
    return reduce(lambda suma,elm:suma+elm**2,lst,0)

print(sumar_cuadrados_v1(lista))
print(sumar_cuadrados_v2(lista))

def suma_especial_v1(lst):
    suma = 0
    for elm in lst:
        if elm%2 == 0:
            suma = suma+ elm**2
        else:
            suma= suma + elm**3
    return suma

def suma_especial_v2(lst):
    return reduce(lambda suma,elm: suma+elm**2 if elm%2==0 else suma+elm**3,lst,0)

print(suma_especial_v1(lista))
print(suma_especial_v2(lista))

