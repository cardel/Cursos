"""
Carlos A Delgado
12 de Junio de 2022
Ejemplo de conversión entre colecciones y los diccionarios
Debe tenerse en cuenta que los diccionarios tienen un par: llave, valor que debe generarse adecuadamente
"""
#Cadenas a diccionarios
cadena = "hola mundo"
diccionario = dict(zip(range(len(cadena)),cadena))
print(diccionario)

#Listas a diccionarios
lista = [10,11,12,13,14,15,16,17,18,19]
diccionario = dict(zip(range(len(lista)),lista))
print(diccionario)

#Tuplas a diccionarios
tupla = (1,2,3,4,5,6,7,8,9,10)
diccionario = dict(zip(range(len(tupla)),tupla))
print(diccionario)

#Conjunto a diccionarios
conjunto = {1,2,3,4,5,6,1,1,2,3,4}
diccionario = dict(zip(range(len(conjunto)),conjunto))
print(diccionario)

#Diccionarios a otras colecciones

dicc = {1:"h",2:"o",3:"l",4:"a",5:" ",6:"m",7:"u",8:"n",9:"d",10:"o"}
cadena = "".join(dicc.values())
print(cadena)

tupla1 = tuple(dicc.values())
tupla2 = tuple(dicc.keys())
tupla3 = tuple(dicc.items())
print(tupla1)
print(tupla2)
print(tupla3)

#Diccionarios a listas
lista1 = list(dicc.values())
lista2 = list(dicc.keys())
lista3 = list(dicc.items())
print(lista1)
print(lista2)
print(lista3)

#Diccionarios a conjuntos  
conjunto1 = set(dicc.values())
conjunto2 = set(dicc.keys())
conjunto3 = set(dicc.items())
print(conjunto1)
print(conjunto2)
print(conjunto3)