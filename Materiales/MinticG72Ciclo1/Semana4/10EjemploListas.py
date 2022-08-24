"""
Carlos Delgado
08 de Junio de 2022
Ejemplo de listas
"""

def promedio_v1(nota1,nota2,nota3,nota4,nota5,nota6):
    suma = nota1+nota2+nota3+nota4+nota5+nota6
    return round(suma/6,2)

def promedio_v2(notas):
    suma = 0
    for nota in notas:
        suma+=nota
    return round(suma/len(notas),2)

def promedio_v3(notas):
    suma = 0
    for index in range(len(notas)):
        suma+=notas[index]
    return round(suma/len(notas),2)

print(promedio_v1(4.5,5.0,3.2,4.5,4.5,1.3))

lista_notas = [4.5,5.0,3.2,4.5,4.5,1.3]

print(promedio_v2(lista_notas))
print(promedio_v3(lista_notas))


