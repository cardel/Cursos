"""
Carlos A Delgado
12 de Junio de 2022
Ejemplos de map
"""
lista = [1,2,3,4,5,6,7,8,9,10]
cuadrados = list(map(lambda x: x**2,lista))
print(cuadrados)

lista2 = [1,2,3,4,5,6,7,8,9,10]
mitad = list(map(lambda x: x/2,lista2))
print(mitad)

listaA = [1,2,3,4,5,6,7,8,9]
listaB = [2,4,6,8,10,12,14,16,18]
listaC = list(map(lambda x,y: x+y,listaA,listaB))
print(listaC)
listaD = list(map(lambda x,y: x*y, listaA,listaB))
print(listaD)

listaK = [1,2,3,4,5,6,7,8,9]
listaM = [2,4,6,8,10,12,14,16,18]
listaN = [1,3,5,7,9,11,13,15,17]
listaO = list(map(lambda x,y,z:x+y+z,listaK,listaM,listaN))
print(listaO)