"""
Carlos A Delgado
25-Mayo-2022
"""

num = int(input("Ingrese el número "))

if num < 0:
    print("El número ingresado debe ser positivo")
else:
    if num % 2 == 0: #Residuo
        print("El número es par")
    else:
        print("El número es impar")