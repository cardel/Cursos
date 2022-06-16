"""
Carlos A Delgado
12 de Junio de 2022
Ayuda para el reto 4
"""
from functools import reduce

def ordenes(rutinaContable):
    print('------------------------ Inicio Registro diario ---------------------------------')
    for orden in rutinaContable:
        factura = orden[0] #Extraigo la factura

        ventas = orden[1:] #Extraigo las ventas que están la posición 1 en adelante (slices)
        #Sumar los totales ustedes necesitan un reduce
        #Debe reemplazar el 0 en la linea 16 con la operación
        pesos = reduce(lambda acc,x: 0 ,ventas,0) #x viene siendo una tupla por ejemplo ("5464", 4, 25842.99)
        #de x deben extraer el total (que está en la posición 1) y multiplicarlo por el valor que (posicion 2) y todoesto 
        # sumarlo al acumulador
        if pesos < 600000:
            pesos += 25000
        print(f"La factura {factura} tiene un total en pesos de {'{:,.2f}'.format(pesos,2)}")
    print('-------------------------- Fin Registro diario ----------------------------------')
#Ejemplos

rutinaContable = [ [1201, ("5464", 4, 25842.99), ("7854",18,23254.99), ("8521", 9, 48951.95)], 
                   [1202, ("8756", 3, 115362.58),("1112",18,2354.99)],
                   [1203, ("2547", 1, 125698.20), ("2635", 2, 135645.20), ("1254", 1, 13645.20),("9965", 5, 1645.20)],
                   [1204, ("9635", 7, 11.99), ("7733",11,18.99), ("88112", 5, 390.95)] 
]
ordenes(rutinaContable)