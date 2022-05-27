"""
Carlos A Delgado
26-Mayo-2022
Ejemplos funciones
"""

def verificar_entrada_discoteca(nombre:str,edad:int)->str:
    """
    Esta función recibe el nombre de una persona (str) y su edad (int)
    Nos retorna un mensaje (str) indicando si la persona puede entrar o no
    """
    if edad >= 18:
        return "La persona con nombre "+nombre+" puede entrar a la discoteca"
    else:
        return "La persona con nombre "+nombre+" no puede entrar a la discoteca"

caso1 = verificar_entrada_discoteca("Juan",14)
print(caso1)
caso2 = verificar_entrada_discoteca("Maria",22)
print(caso2)

