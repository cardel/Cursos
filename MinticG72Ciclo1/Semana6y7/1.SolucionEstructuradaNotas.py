"""
Carlos A Delgado
21 de Junio de 2022
Solución estructurada al problema de notas
"""

def calcular_notas(codigo,notas):
    """
    Las notas están en una escala de 1 a 100
    Debemos quitar la peor nota
    """
    minima = min(notas) #Extraer la nota mínima
    promedio = (sum(notas)-minima)/4
    promedio5 = round(promedio*5/100,2)

    return f"El promedio del estudiante con código {codigo} es {promedio5}"


print(calcular_notas("ABC123",[100,90,70,80,50]))