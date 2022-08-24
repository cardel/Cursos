"""
Carlos A Delgado
Ejemplo Ciclo While
08 de Junio de 2022
"""

import re


n = 5
while n > 0:
    print(n)
    n = n-1

print("Despegue!")

def factorial(n):
    resultado = 1
    numero_actual = 2 #Variable externa al while que nos va ayudar a controlarlo

    while numero_actual <= n:
        resultado = resultado * numero_actual
        numero_actual += 1 #numero_actual = numero_actual+1
        #Cambio que lleva la variable a romper la condición, es decir volverla falsa

    return resultado

print(factorial(5))