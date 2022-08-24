"""
Autor: Carlos A Delgado
Fecha: 18 de Marzo de 2022
Descripción: Archivo de ejemplo de ejercicio de discoteca
"""

edad = int(input("Ingrese su edad "))

if edad>=0 and edad < 10:
	print("Vaya a la niñiteca")
elif edad>=10 and edad < 15:
	print("Vaya a la chiquiteca")
elif edad >= 15 and edad <= 17:
	print("Vaya a la casa")
elif edad>=18 and edad < 25:
	print("Vaya a la sección de jovenes")
elif edad >= 25 and edad <= 35:
	print("Vaya a la sección adultos jovenes")
elif edad>35 and edad < 65:
	print("Vaya la sección de maduros")
elif edad>=65 and edad <80:
	print("Vaya a la viejoteca")
elif edad >= 80:
	print("Vaya a la sección VIP")
else:
	print("Edad no válida")
