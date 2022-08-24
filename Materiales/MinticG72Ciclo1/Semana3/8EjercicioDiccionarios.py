"""
Carlos A Delgado
03 de Junio 2022
Descripción: Código para estudiar diccionarios
"""
def calcular_promedio(notas):
    """
    Esta función recibe un diccionario con floats y calculamos su promedio
    notas: diccionario de flotantes
    retorna: un flotante que indica el promedio
    """
    nota1 = notas["nota1"] #Esta a la derecha es para consultar
    nota2 = notas["nota2"]
    nota3 = notas["nota3"]
    nota4 = notas["nota4"]
    nota5 = notas["nota5"]
    promedio = round((nota1+nota2+nota3+nota4+nota5)/5)
    return promedio

informacion = {} #Creamos un diccionario vacío
informacion["nota1"] = 4.5 #Esta a la izquierda para crearlo
informacion["nota2"] = 3.8
informacion["nota3"] = 3.2
informacion["nota4"] = 4.9
informacion["nota5"] = 2.9
pro = calcular_promedio(informacion)
salida = "El promedio es "+str(pro)
print(salida)
print(informacion)