"""
Carlos A Delgado S
12 de Junio de 2022
"""
tareas ={
    "01": {
        "descripcion" : "Ir a mercar",
        "estado" : "pendiente",
        "tiempo" : 60
    },
    "02":{
        "descripcion" : "Estudiar",
        "estado" : "pendiente",
        "tiempo" : 180
    },
    "03":{
        "descripcion" : "Hacer ejercicio",
        "estado" : "pendiente",
        "tiempo" : 50
    }
}
def getTareas():
    return tareas

def create(tareas,id,tarea):
    tareas[id] = tarea
    return tareas

def update(tareas,id,tarea):
    tareas[id] = tarea
    return tareas

def remove(tareas,id):
    tareas.pop(id)
    return tareas

def existsTarea(id):
    if tareas.get(id)==None:
        return False
    else:
        return True