"""
Autor: Carlos A Delgado
Fecha: 01 de Abril de 2022
Descripción: Ejercicio de las notas
"""
nota_talleres = float(input("Ingrese la nota de talleres\n"))
nota_parcial = float(input("Ingrese la nota de parcial\n"))
nota_opcional = float(input("Ingrese la nota del opcional\n"))
nota_proyecto = float(input("ingrese la nota del proyecto\n"))
nota_asistencia = float(input("Ingrese la nota de asisencia\n"))


def calcular_nota(talleres,parcial,opcional, proyecto, asistencia):
    if (talleres >= 0 and talleres <= 5.0) and (parcial >= 0 and parcial <= 5.0) and (opcional >=0 and opcional <= 5.0) and (proyecto >=0 and proyecto <= 5.0) and(asistencia >=0 and asistencia <= 5.0):
        def_talleres = 0.2*talleres
        if parcial > opcional:
            def_parcial = parcial*0.2
        else:
            def_parcial = opcional*0.2
        def_proyecto = 0.3*proyecto
        def_asistencia = 0.3*asistencia
        return def_talleres+def_parcial+def_proyecto+def_asistencia
    else:
        print("Las notas no son válidas") 


nota_final = calcular_nota(nota_talleres,nota_parcial,nota_opcional
                    ,nota_proyecto, nota_asistencia)

print(nota_final)