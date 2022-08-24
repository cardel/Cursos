from CRUDPersistencia import *

def menu():
    tareas = getTareas()
    while True:
        print("Aplicación Tareas")
        print("1. Adicionar tarea")
        print("2. Consultar tareas")
        print("3. Actualizar tarea")
        print("4. Eliminar tarea")
        print("5. Salir")
        print("Ingrese una opción")
        opcion = int(input())
        if opcion == 1:
            print("Adicionar tarea")
            id = input("Ingrese el identitificador ")
            descripcion = input("Ingrese la descripcion ")
            estado = input("Ingrese el estado ")
            tiempo = int(input("Ingrese el tiempo de la tarea "))

            tarea = {
                "descripcion": descripcion,
                "estado": estado,
                "tiempo": tiempo
            }
            tareas = create(tareas,id,tarea)
        elif opcion == 2:
            print(tareas)
        elif opcion == 3:
            print("Ingrese el ID de la tarea")
            id = input()
            if existsTarea(id):
                descripcion = input("Ingrese la descripcion ")
                estado = input("Ingrese el estado ")
                tiempo = int(input("Ingrese el tiempo de la tarea "))
                tarea = {
                    "descripcion": descripcion,
                    "estado": estado,
                    "tiempo": tiempo
                }
                tareas = update(tareas,id,tarea)
            else:
                print("La tarea con id "+id+" no existe ")
        elif opcion == 4:
            print("Ingrese el ID de la tarea")
            id = input()
            if existsTarea(id):
                tareas = remove(tareas,id)
            else:
                print("La tarea con id "+id+" no existe")
        elif opcion == 5:
            break
        else:
            print("Opción no válida")
menu()
