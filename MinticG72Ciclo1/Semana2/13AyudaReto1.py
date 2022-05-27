"""
Carlos A Delgado
26 de Mayo de 2022
Plantilla para el reto número 1
"""

def CDT(usuario,capital,tiempo):
    """
    usuario: str que contiene el nombre de la persona
    capital: int que contiene el capital inicial
    tiempo: int que contiene el tiempo es meses
    """
    #if tiempo ... depende si es <= 2 o > 2
    #Pilas: Esto es solo un ejemplo de cómo deberia ir, pero no representa la solución del problema
    porcentaje_interes=0.03
    interes = capital*porcentaje_interes*tiempo/12
    valor_final = capital+interes

    return "Para el usuario "+usuario+" La cantidad de dinero a recibir, según el monto inicial "+str(capital)+" para un tiempo de "+str(tiempo)+" meses es: "+str(valor_final)


print(CDT("AB1012",1000000,3))
print(CDT("QW3456",5000000,2))
print(CDT("ER3366",650000,2))

