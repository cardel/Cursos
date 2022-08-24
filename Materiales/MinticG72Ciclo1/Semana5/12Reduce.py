"""
Carlos A Delgado
12 de Junio de 2022
Ejemplo reduce
"""
from functools import reduce

lista = [1, 2, 3, 4, 5, 6,7,8,9]
suma = 0
for elm in lista:
    suma+=elm

print(suma)

valor = reduce(lambda acc=0,x=0: acc+x,lista) #Usamos acc=0,x=0 para establecer como valor por defecto 0
print(valor)
valor = reduce(lambda acc,x: acc+x,lista,0) #El tercer argumento tiene el valor por defecto que es 0
print(valor)

listaB = ["python","java","c++","c#","ruby"]
cadena = reduce(lambda acc="",elm="":acc+"->"+elm,listaB)
print(cadena)
cadena = reduce(lambda acc,elm:acc+"->"+elm,listaB)
print(cadena)