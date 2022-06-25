"""
Carlos A Delgado
24 de Junio de 2022
Una tienda de electrodomesticos desea saber cuantos elementos de un producto ha vendido y su precio. La información viene codificada en una lista de tuplas, cada una de ellas de dos posiciones, la primera posición es el codigo del producto y la segunda posición es el número de unidades vendidas en una venta.

[(1 10) (1 20) (2 30) (2 10) (3 10) (4 10) (5 20)]

Retornar

(2 40)
"""

def mayor_vendido(lista_ventas):
    acumulado = {}
    for elm in lista_ventas:
        if acumulado.get(elm[0])!=None:
            acumulado[elm[0]]+=elm[1]
        else:
            acumulado[elm[0]]=elm[1]
    idmax = 0
    elmmax = 0
    for k,v in acumulado.items():
        if v > elmmax:
            idmax = k
            elmmax = v
    
    return (idmax,elmmax)



def mayor_vendido_id(lista_ventas, lds):
    listaF = list(filter(lambda x: x[0] in lds,lista_ventas))
    return mayor_vendido(listaF)

print(mayor_vendido([(1, 10), (1, 20), (2, 30) ,(2, 10) ,(3, 10) ,(4, 10), (5 ,20)]))
#(2 40)
print(mayor_vendido_id([(1, 10), (1, 20), (2, 30) ,(2, 10) ,(3, 10) ,(4, 10), (5 ,20)],[1,4,5]))
#(1 30)