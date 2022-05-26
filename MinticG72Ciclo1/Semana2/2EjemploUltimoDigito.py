"""
Carlos A Delgado 
25 de Mayo de 2022
Programa para saber si dos digitos son iguales
"""

numero_1 = int(input("Ingrese el primer número "))
numero_2 = int(input("Ingrese el segundo número "))

digito_1 = numero_1 % 10 #El residuo de la división con 10
digito_2 = numero_2 % 10 #El residuo de la división con 10

if digito_1 ==digito_2:
    print("Los últimos digitos son iguales")
else:
    print("Los últimos digitos no son iguales")