"""
Carlos A Delgado
03 de Junio de 2022
Material de apoyo para el reto 2
"""

def cliente(informacion):
    ##Primer paso: Extraer la información del diccionarios
    id_cliente = int(informacion["id_cliente"])
    nombre = informacion["nombre"]
    edad = int(informacion["edad"])
    primer_ingreso = bool(informacion["primer_ingreso"])

    ##Logica para determinar la salida (su trabajo)
    atraccion = "X-treme" #Esto debe calcular con if
    #No son Carros chocones no CarrosChocones
    total_boleta = 20000 #Esto debe calcular con if
    apto = True #Esto debe calcularse

    ##Salida
    salida = {} #Creo el diccionario vacio
    salida["nombre"] = nombre
    salida["edad"] = edad
    salida["atraccion"] = atraccion
    salida["apto"] = apto
    salida["primer_ingreso"] = primer_ingreso
    salida["total_boleta"] = round(total_boleta,1) #No lo dicen en el enunciado
    return salida

#Ejemplo, no copiar en la solución del reto
#En el reto únicamente tenemos la función con su return
#Nada de prints nada de inputs (Prohibidos)
informacion = {
    'id_cliente': 3,
    'nombre': 'Tatiana Suarez',
    'edad': 17,
    'primer_ingreso': True
}

print(cliente(informacion))