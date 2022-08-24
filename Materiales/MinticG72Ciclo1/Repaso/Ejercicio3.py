"""
Carlos A Delgado S
23 de Junio de 2022

Una empresa requiere un programa para gestionar sus facturas, estas
facturas manejan un código de producto y la cantidad comprada.

Los productos que vende la empresa son:

Codigo  Descripción  Valor unitario
100     Camisa           10000
200     Pantalón         30000
300     Medias           10000
400     Saco              8000

Estos precios no incluyen el IVA 19%. La información está codificada en una lista de tuplas, donde cada tupla tiene el código y la cantidad vendida.
[(100,10), (200,20),(300,10),(400,20),(100,20)]
La función debe retornar un diccionario que tenga la siguiente estructura
{"subtotal":subtotal,"iva":valor_iva,"total":total}
El valor del iva y el total redondearlo con dos decimales round(...,2)
Para el ejemplo anterior se retorna {"subtotal":1160000,"iva":220400,"total":1380400}

def generar_venta(lst_ventas):
    pass #Esto se debe de borrar

"""
def obtener_valor(cod):
    if cod==100:
        return 10000
    elif cod==200:
        return 30000
    elif cod==300:
        return 10000
    elif cod==400:
        return 8000
    else: #Si alguien metio un codigo mal
        return 0

def generar_venta(lst_ventas):
    salida = {} #Inicializo un diccionario vacio
    subtotal = 0
    valor_iva = 0
    total = 0
    for venta in lst_ventas:
        subtotal += obtener_valor(venta[0])*venta[1]

    salida["subtotal"] = subtotal
    valor_iva= round(subtotal*0.19,2)
    salida["valor_iva"] = valor_iva
    total = round(subtotal+valor_iva,2)
    salida["total"] = total
    return salida

print(generar_venta([(100,10), (200,20),(300,10),(400,20),(100,20)]))