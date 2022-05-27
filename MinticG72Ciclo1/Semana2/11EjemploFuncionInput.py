"""
Carlos A Delgado
26 de Mayo de 2022
Ejemplo de función con input
"""

def sumar_dos_numeros(a,b):
    c = a+b
    return "El resultado de sumar "+str(a)+" y "+str(b)+" es "+str(c)

def ejemplo():
    c = 2
    t = 8
    return c*t

numA = int(input("Ingrese el primer número "))
numB = int(input("Ingrese el segundo número "))
resultado = sumar_dos_numeros(numA,numB)
print(resultado)
resultado2 = sumar_dos_numeros(4,5)
print(resultado2)
resultado3 = sumar_dos_numeros(numA+10,3)
print(resultado3)
print(ejemplo())