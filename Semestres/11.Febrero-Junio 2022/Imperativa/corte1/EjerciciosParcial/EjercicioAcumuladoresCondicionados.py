"""
Autor: Carlos A Delgado
Fecha: 29 de Abril del 2022
Descripción: EJercicio de torneo de futbol
"""

def informacion_equipo(num_partidos):
    nombre = input("Ingrese el nombre de la selección ")
    
    acc_partidos_ganados = 0
    acc_partidos_empatados = 0
    acc_partidos_perdidos = 0
    acc_puntos = 0
    acc_goles_favor = 0 
    acc_goles_contra = 0

    for i in range(num_partidos):
        print("Partido ",i+1)
        gol_equipo1 = int(input("Ingrese el número de goles del equipo 1 "))
        gol_equipo2 = int(input("Ingrese el número de goles del equipo 2 "))

        acc_goles_contra+= gol_equipo2
        acc_goles_favor+= gol_equipo1

        if(gol_equipo1>gol_equipo2):
            acc_partidos_ganados+=1
            acc_puntos+=3
        elif gol_equipo1==gol_equipo2:
            acc_partidos_empatados+=1
            acc_puntos+=1
        else:
            acc_partidos_perdidos+=1

    return f"Selección {nombre}, puntos totales {acc_puntos}, partidos ganados {acc_partidos_ganados},partidos perdidos {acc_partidos_perdidos}, partidos empatados {acc_partidos_empatados}, goles a favor {acc_goles_favor} goles en contra {acc_goles_contra}"

num_partidos = int(input("Ingrese el numero de partidos "))
print(informacion_equipo(num_partidos))