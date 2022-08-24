"""
Autor: Carlos Delgado 
Fecha: 08 de Junio de 2022
Ejemplo de ingreso de información con while
"""

def calcular_promedio():
    print("Ingrese la nota del estudiante, -1 para terminar")
    nota = float(input())
    suma = 0 #Suma de las notas
    contar = 0 #El número de notas
    while nota!=-1:
        suma+=nota #suma = suma + nota
        contar+=1 #contar = contar+1
        print("Ingrese la nota del estudiante, -1 para terminar")
        nota = float(input())        
    return suma/contar

def calcular_promedio_v2():
    print("Ingrese la nota del estudiante, -1 para terminar")
    nota = float(input())
    suma = 0 #Suma de las notas
    contar = 0 #El número de notas
    while True:
        if nota==-1:
            break
        suma+=nota #suma = suma + nota
        contar+=1 #contar = contar+1
        print("Ingrese la nota del estudiante, -1 para terminar")
        nota = float(input())        
    return suma/contar


print(calcular_promedio_v2())