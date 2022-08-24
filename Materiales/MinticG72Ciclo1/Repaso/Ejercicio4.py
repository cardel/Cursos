"""
Carlos A Delgado
23 de Junio de 2022

En un parque de diversiones, la gerencia desea saber cuales son las atracciones que más ganancias generan, de acuerdo a esto se tiene una lista de diccionarios, las cuales tienen la atracción y el número de tiquetes que se vendieron en cada día. Las atracciones y sus precios son:

Carros chocones    10000
Sillas voladoras 4000
Circo  15000
Paseo romántico 20000

La idea es retornar un diccionario que tenga el total de las ventas por atracción.
 
def determinar_atraccion(lst_tickets):
	pass #Eliminar

[ {"Carros chocones":10,"Sillas voladoras":20,"Circo":10, "Paseo romántico":20},
{"Carros chocones":4,"Sillas voladoras":20,"Circo":3, "Paseo romántico":5},
{"Carros chocones":2,"Sillas voladoras":20,"Circo":1, "Paseo romántico":8}]

Retorna
{"Carros chocones":160000,"Sillas voladoras":240000,"Circo":210000, "Paseo romántico":660000}
"""

def obtener_valor_atraccion(atraccion):
    if atraccion == "Carros chocones":
        return 10000
    elif atraccion == "Sillas voladoras":
        return 4000
    elif atraccion== "Circo":
        return 15000
    elif atraccion=="Paseo romántico":
        return 20000
    else:
        return 0

def determinar_atraccion(lst_tickets):
    salida = {}
    acc_carros_chocones = 0
    acc_sillas_voladoras = 0
    acc_circo = 0
    acc_paseo = 0
    
    for ticket_diario in lst_tickets:
        acc_carros_chocones += ticket_diario["Carros chocones"]
        acc_sillas_voladoras += ticket_diario["Sillas voladoras"]
        acc_circo += ticket_diario["Circo"]
        acc_paseo += ticket_diario["Paseo romántico"]

    valor_carros_chocones = acc_carros_chocones*obtener_valor_atraccion("Carros chocones")
    valor_sillas_voladoras = acc_sillas_voladoras*obtener_valor_atraccion("Sillas voladoras")
    valor_circo = acc_circo*obtener_valor_atraccion("Circo")
    valor_paseo = acc_paseo*obtener_valor_atraccion("Paseo romántico")

    salida["Carros chocones"] = valor_carros_chocones
    salida["Sillas voladoras"] = valor_sillas_voladoras
    salida["Circo"] = valor_circo
    salida["Paseo romántico"] = valor_paseo

    return salida

print(determinar_atraccion([ {"Carros chocones":10,"Sillas voladoras":20,"Circo":10, "Paseo romántico":20},
{"Carros chocones":4,"Sillas voladoras":20,"Circo":3, "Paseo romántico":5},
{"Carros chocones":2,"Sillas voladoras":20,"Circo":1, "Paseo romántico":8}]))

#{Paseo romántico=660000, Sillas voladoras=240000, Carros chocones=160000, Circo=210000}