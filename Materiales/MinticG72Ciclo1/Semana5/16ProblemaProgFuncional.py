"""
Carlos A Delgado
12 de Junio de 2022

La empresa ABCD tiene hasta 100 empleados. La compañía decide crear un número de identificación único UID para cada uno de sus empleados. La compañía le ha asignado la tarea de validar los UIDs generados aleatoriamente. Un UID válido debe
cumplir con las siguientes reglas: 
•Debe contener por lo menos dos letras mayúsculas en el alfabeto inglés.
•Debe tener por lo menos 3 dígitos.
•Contener únicamente dígitos alfanuméricos.
•No tener repeticiones.
•Contener exactamente 10 caracteres.

Si no ejecuta por un problema de codificación entonces eliminar el comentario, ya que contiene ñ y tíldes
"""

def validar_UUID(lst_uuid):
    """
    Esta función recibe lista de str (uuid) y vamos a verificar si cumple con las condiciones
    Retornando Válido o no válido
    """
    #Primera condición tiene al menos dos letras en el alfabeto inglés
    #Hago un filtro mirando si tiene letras y tomo su tamaño, si este es mayor que 2 entonces sigo verificando
    salida = [] #Válido o no válido
    for uuid in lst_uuid:
        cond = []
        cond1 = list(filter(lambda x: x.isupper(),list(uuid)))
        cond.append(len(cond1)>=2) #Si el tamaño es mayor que 2 significa que hay al menos 2 letras mayusculas

        cond2 = list(filter(lambda x: x.isdigit(),list(uuid)))
        cond.append(len(cond2)>=3) #Debe tener al menos 3 digitos

        cond3 = all(map(lambda x: x.isalnum(),list(uuid)))
        cond.append(cond3)

        cond4 = set(uuid) #El conjunto no tiene repetidos
        cond.append(len(cond4)==len(uuid)) #Verifico que no tenga letras repetidas con un conjunto

        cond.append(len(uuid)==10)

        print(cond)
        if all(cond):
            salida.append("Válido")
        else:
            salida.append("No válido")

    return salida
        


ejemplo = ["B1CD102354","B1CDEF2354","B1CDEF235#","B1CDEF2354A","BMCDEFH3J4","b1cdeF2354"]
print(validar_UUID(ejemplo))
#Salida ["No válido","válido"]
