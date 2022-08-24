"""
Carlos A Delgador
26 de Mayo de 2022
Ejemplo de condicional en cascada
"""

def determinar_digitos(numero):
    """
    Esta función recibe un número y nos indica si tiene 1,2,3 o 4 dígitos
    """
    if numero < 0:
        numero = numero*-1 #Transformo de negativo o positivo
    
    if numero >= 0 and numero < 9:
        return "El número tiene 1 dígito"
    elif numero>=10 and numero <= 99:
        return "El número tiene 2 dígitos"
    elif numero>=100 and numero<=999:
        return "El número tiene 3 dígitos"
    elif numero>=1000 and numero<=9999:
        return "El número tiene 4 dígitos"
    else:
        return "El número más de 4 digitos"

num = int(input("Ingrese un número "))
mensaje = determinar_digitos(num)
print(mensaje)

"""
if anidado (java,c++ ciclo 2 y 3)
pero recomiendo usar en cascada
"""
def determinar_digitos_if_anidado(numero):
    """
    Esta función recibe un número y nos indica si tiene 1,2,3 o 4 dígitos
    """
    if numero < 0:
        numero = numero*-1 #Transformo de negativo o positivo
    
    if numero >= 0 and numero < 9:
        return "El número tiene 1 dígito"
    else:
        if numero>=10 and numero <= 99:
            return "El número tiene 2 dígitos"
        else:
            if numero>=100 and numero<=999:
                return "El número tiene 3 dígitos"
            else: 
                if numero>=1000 and numero<=9999:
                    return "El número tiene 4 dígitos"
                else:
                    return "El número más de 4 digitos"