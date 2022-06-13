"""
Carlos A Delgado
12 de Junio de 2022
Ejemplos con filter de Python
"""

lista = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]
listaF = list(filter(lambda x: x%2==0,lista))
print(listaF)
listaG = list(filter(lambda x: x>5,lista))
print(listaG)
listaH = list(filter(lambda x: x<0, lista))
print(listaH)