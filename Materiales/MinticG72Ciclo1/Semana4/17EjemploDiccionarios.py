"""
Carlos A Delgado
10 de Junio de 2022
ejemplo de diccionarios
"""
estudiantes ={
    "ABC123":{
        "nombre": "juan",
        "apellido":"suarez",
        "edad":19
    },
    "ABC124":{
        "nombre": "maria",
        "apellido":"lozano",
        "edad":17
    }
}
print(estudiantes)

for k,v in estudiantes.items():
    for k1,v1 in v.items():
        print(k1,v1)