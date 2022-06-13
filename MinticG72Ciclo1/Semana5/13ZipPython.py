"""
Carlos A Delgado 
12 de Junio de 2022
Ejemplo funcion zip
"""
nombres = ["Juan","María","Sofía","Pedro"]
apellidos =["Lozano","Suarez","Dominguez","Delgado"]
edades = [20,15,12,31]
datos = list(zip(nombres,apellidos,edades))
print(datos)

for nom,apel,edad in zip(nombres,apellidos,edades):
    if edad<18:
        print("Nombre "+nom+" apellido "+apel+" edad "+str(edad))