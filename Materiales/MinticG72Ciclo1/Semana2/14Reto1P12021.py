"""
Carlos A Delgado
26 de Mayo de 2022
Solución del reto del grupo 10 Mintic 2021
"""

def generarTablaPosicion(nombre,cantPartidosGanados,cantPartidosPerdidos,cantPartidosEmpatados,numGolesFavor,numGolesContra):
    """
    Esta función recibe los datos de un equipo durante un torneo y nos retorna sus puntos y la diferencia de goles
    """
    puntos = 3*cantPartidosGanados+cantPartidosEmpatados
    diferencia = numGolesFavor-numGolesContra

    return "Equipo: "+nombre+ " Puntos: "+str(puntos)+" diferencia: "+str(diferencia)

print(generarTablaPosicion("Colombia",1,0,2,4,2))