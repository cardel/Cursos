"""
Autor: Carlos Delgado
Fecha: 18 de Marzo de 2022
Descripción: Archivo de ejemplo de condicionales
"""
ventas = float(input("Ingrese valor de las ventas "))
categoria = int(input("Ingrese la categoría "))
comision = 0
if categoria == 1:
    comision = ventas*0.1
elif categoria == 2:
    comision = ventas*0.2
elif categoria == 3:
    comision = ventas*0.35
elif categoria == 4:
    comision = ventas*0.45
elif categoria == 5:
    comision = ventas*0.5
elif categoria == 6:
    comision = ventas*.6
else:
    print("Unknown categoria")

print("El vendedor tiene una comisión de ",comision)