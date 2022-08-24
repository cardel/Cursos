"""
Carlos A Delgado
29 de Abril de 2021
Descripción: APlicativo para solicitar notas
"""


def mostrar_notas(num_estudiantes):
    acc_nota_talleres = 0
    acc_parcial1 = 0
    acc_parcial2 = 0
    acc_quices = 0
    acc_proyecto = 0
    for i in range(num_estudiantes):
        notas_talleres = float(
            input(f"ingrese la nota del taller estudiante {i+1} "))
        parcial1 = float(
            input(f"ingrese la nota del primer parcial del estudiante {i+1} "))
        parcial2 = float(
            input(f"ingrese la nota del segundo parcial del estudiante {i+1} "))
        quices = float(
            input(f"ingrese la nota de los quices del estudiante {i+1} "))
        proyecto = float(
            input(f"ingrese la nota del proyecto del estudiante {i+1} "))

        acc_nota_talleres += notas_talleres
        acc_parcial1 += parcial1
        acc_parcial2 += parcial2
        acc_quices += quices
        acc_proyecto += proyecto

    acc_nota_talleres /= num_estudiantes
    acc_parcial1 /= num_estudiantes
    acc_parcial2 /= num_estudiantes
    acc_quices /= num_estudiantes
    acc_proyecto /= num_estudiantes

    return f"Los estudiantes tuvieron un promedio de talleres {round(acc_nota_talleres,2)}, parcial 1 {round(acc_parcial1,2)}, parcial 2 {round(acc_parcial2,2)} quices {round(acc_quices,2)} y de proyecto final {round(acc_proyecto,2)}"


num_estudiantes = int(input("Ingrese el número de estudiantes "))
resultado = mostrar_notas(num_estudiantes)
print(resultado)
