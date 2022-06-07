"""
Carlos A Delgado
07 de Junio de 2022
Solución del reto 2 del año 2021 del grupo 10
"""
import math

def estudio_credito(valor_solicitado,periodo):
    """
    Esta función recibe un valor solicitado de credito y el tiempo que va durar el credito y nos da un diccionario con el valor de la cuota y el valor total del prestamo.
    """
    salida = {} #Construimos el diccionaro de salida
    interes = 0 #Interés
    #Lógica del programa
    if periodo>=1 and periodo <= 12:
        interes = 3.5/100
    elif periodo > 12 and periodo <= 24:
        interes = 3/100
    elif periodo > 24 and periodo <= 36:
        interes = 2.3/100
    elif periodo > 60:
        interes = 1/100
    else:
        interes = 1.8/100

    interes_total = interes*periodo
    total_prestamo = valor_solicitado+valor_solicitado*interes_total

    valor_cuota = math.ceil(total_prestamo/periodo)

    #Construcción de la salida
    salida["valor_cuota"] = valor_cuota
    salida["valor_total"] = total_prestamo

    return salida

res1 = estudio_credito(50000000,24)
print(res1)

res2 = estudio_credito(50000000,65)
print(res2)