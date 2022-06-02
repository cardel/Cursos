"""
Carlos A Delgado
01 de Junio de 2022
Operaciones en strings
"""
cadena1 = "Hola mundo"
cadena2 = "mundo"
print(cadena2 in cadena1)
print("hola" in cadena1)
print("Hola" in cadena1)
print("a" in cadena1)
print(cadena1 == cadena2)
print("Hola mundo" == cadena1)

cadena1 = "zapato"
cadena2 = "sapo"
cadena3 = "Zapato"

print(cadena1 >= cadena2)
print(cadena3 >= cadena2)

cadena3 = "vaca"
cadena4= cadena3.upper()
print(cadena4)

cadena5 = "PErRO"
cadena6 = cadena5.lower()
print(cadena6)

cadena7 ="habia Una Vez un barco chiQuito, muy chiquITo"
cadena8 = cadena7.capitalize()
print(cadena8)

print(cadena8.find("ch"))
print(cadena8.find("ch",24))


cadena9= "         Hola que tal ¿Como estas?               "
cadena10 = cadena9.strip()
print(cadena10)