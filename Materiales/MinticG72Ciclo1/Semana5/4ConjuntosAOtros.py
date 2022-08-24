"""
Carlos A Delgado
12 de Junio de 2022
Ejemplo de conversión de conjuntos a otros
Es de tomar en cuenta que los conjuntos no son secuenciales, por lo tanto, no es posible tener un orden dado
"""
conjunto = {"1","2","3","4","5","6","7","8"}
cadena = "".join(conjunto)
print(cadena)
"""
En este punto se observa que los conjuntos NO TIENEN ORDEN
"""
lista = list(conjunto)
tupla = tuple(conjunto)
print(lista)
print(tupla)