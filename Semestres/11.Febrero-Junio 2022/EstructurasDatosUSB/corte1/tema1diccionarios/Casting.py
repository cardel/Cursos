
tupla = 1,2,3,4,5,6,6,6,6
lista = list(tupla)
print(lista)

con = set(tupla)
print(con)

diccionario1 = diccionario1 = {"Nombre":"Carlos","Edad":34,"Gustos":["Ajedrez","Juego en linea","Comer"]}

print(list(diccionario1.values()))
#print(set(diccionario1.values()))
print(tuple(diccionario1.values()))

print(list(diccionario1.keys()))
print(set(diccionario1.keys()))
print(tuple(diccionario1.keys()))