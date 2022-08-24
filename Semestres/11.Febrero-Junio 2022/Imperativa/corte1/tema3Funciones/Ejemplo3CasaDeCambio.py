"""
Autor: Carlos A Delgado
Fecha: 25 de Marzo de 2022
Descripción: Ejemplo de la casa de cambios del curso
"""

"""
mostrar_precios_divisas
inicio
	divisa: str
	si divisa = "dolar"
		retorna 3080
	sino si divisa = "euro"
		retorna 3469
	sino si divisa = "libra"
		returna 4748
	sino
		imprimir("Divisa no valida")

fin
"""
def mostrar_precios_divisas(divisa):
    if divisa == "dolar":
        return 3080
    elif divisa == "euro":
        return 3469
    elif divisa == "libra":
        return 4748
    else:
        print("Divisa no válida")

"""
convertir_divisa:
inicio
	divisa:str
	valor_a_convertir:real
	si divisa = "dolar"
		retorna valor_a_convertir/3080
	sino si divisa = "euro"
		retorna valor_a_convertir/3469
	sino si divisa = "libra"
		retorna valor_a_convertir/4748
 	sino:
		imprimir("divisa no valida")
fin
"""
def convertir_divisa(divisa,valor_a_convertir):
    if divisa=="dolar":
        return valor_a_convertir/3080
    elif divisa=="euro":
        return valor_a_convertir/3469
    elif divisa=="libra":
        return valor_a_convertir/4748
    else:
        print("Divisa no válida")

"""
General
"""
opcion = int(input("Ingrese la opción\n1.Consulta de precios divisa\n2.Conversión de pesos a una divisa\n¿Cual opción desea?: "))
divisa = input("Ingrese la divisa: dolar,euro y libra ")
valor_a_convertir = float(input("Ingrese el valor a convertir "))

if opcion == 1:
    print(mostrar_precios_divisas(divisa))
elif opcion==2:
    valor_convertido = convertir_divisa(divisa, valor_a_convertir)
    print(valor_convertido)
else:
    print("Opción no válida")