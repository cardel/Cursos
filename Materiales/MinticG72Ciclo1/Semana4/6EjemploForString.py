"""
Carlos A Delgado
08 de Junio de 2022
Ejemplo con String
"""

mensaje ="¿Porque te casaste Adonai?"
for i in range(len(mensaje)):
    if mensaje[i] > "m":
        print(mensaje[i],end=" ")

for c in mensaje:
    print(c)