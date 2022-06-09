"""
Carlos A Delgado
08 de Junio de 2022
Ejemplo con Diccionarios
"""
dicc = {}
dicc["nombre"] = "Maria"
dicc["apellidos"] = "la del Barrio"
dicc["direccion"] = "Calle Falsa 123"
dicc["telefono"] = 2556352
dicc["edad"] = 19

for llave in dicc: #Itera las llaves
    print(llave,dicc[llave])

for llave,valor in dicc.items(): #Itera sobre llave,valor
    print(llave,valor)

