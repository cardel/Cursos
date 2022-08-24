"""
Carlos A Delgado
07 de Junio de 2022
"""

def cliente(informacion):
    """
    Esta función recibe una información a través de un diccionario que tiene los datos de id_cliente, nombre, edad y primer_ingreso
    Nos retorna un diccionario con los siguientes campos: nombre, edad, atraccion, apto, primer_ingreso, total_boleta
    """    
    salida = {} #Salida
    #Extracción de los datos del diccionario
    id_cliente = informacion['id_cliente']
    nombre = informacion["nombre"]
    edad = informacion["edad"]
    primer_ingreso=informacion["primer_ingreso"]

    #Logica relacionada
    """
    aqui se calcular la atracción, el valor de apto y finalmente el valor de la boleta
    """
    total_boleta = 0
    apto = True
    atraccion = "Carros chocones"

    """
    Si edad > 18:
       atraccion = "X-Treme"
       apto = Verdadero
       total_boleta = 20000

       Si primer_ingreso == Verdadero:
            total_boleta = total_boleta*0.95
    Sino edad >= 15 y edad <= 18:
       atraccion = "Carros chocones"
       apto = Verdadero
       total_boleta = 5000
       Si primer_ingreso == Verdadero:
            total_boleta = total_boleta*0.93
    Sino edad >= 7 y edad < 15:
       atraccion = "Sillas voladoras"
       apto = Verdadero
       total_boleta = 10000
       Si primer_ingreso == Verdadero:
            total_boleta = total_boleta*0.95
    Sino:
       atraccion = "N/A" #Caso de que no esta especifico
       apto = Falso
       total_boleta = "N/A"
    """
    #Estructuras la salida
    salida["nombre"] = nombre #Ya está
    salida["edad"] = edad #Ya está
    salida["atraccion"] = atraccion
    salida["apto"] = apto
    salida["primer_ingreso"] = primer_ingreso #Ya esta
    salida["total_boleta"] = total_boleta
    return salida

diccionarioEjemplo = {
    "id_cliente": 12,
    "nombre": "Juan Velez",
    "edad": 19,
    "primer_ingreso": True
}

print(cliente(diccionarioEjemplo))
#print(diccionarioEjemplo)
#print(diccionarioEjemplo["edad"])