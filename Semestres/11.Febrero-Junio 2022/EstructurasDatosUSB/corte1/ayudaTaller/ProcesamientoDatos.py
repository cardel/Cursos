def calcular_nota(notas_estudiantes):
    salida = []
    for estudiante in notas_estudiantes:
        nombre = estudiante["Nombre"]
        semestre = estudiante["Semestre"]
        parcial = estudiante["Nota parcial"]
        talleres = estudiante["Notas talleres"]
        quices = estudiante["Notas quices"]
        for quiz in quices:
            print(quiz)

        resultado = {"Nombre":nombre,"Semestre":semestre,"Parcial":parcial}
        salida.append(resultado)
    return salida



lista1 = [
    {"Nombre":"Juan Valdez","Semestre":4,"Nota parcial":4.5,"Notas talleres":(4,3),"Notas quices":(1,4,5,5,5,4)},
    {"Nombre":"Maria Suarez","Semestre":3,"Nota parcial":5,"Notas talleres":(4,4),"Notas quices":(5,4,5,5,3,4)},
    {"Nombre":"Carlos Delgado","Semestre":5,"Nota parcial":2,"Notas talleres":(3,4),"Notas quices":(1,4,1,1,3,4)}
]

print(calcular_nota(lista1))