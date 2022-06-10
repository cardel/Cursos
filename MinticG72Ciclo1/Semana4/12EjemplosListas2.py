"""
Carlos A Delgado
09 de Junio de 2022
Ejemplo de listas
"""

lista = ["mercurio","venus","tierra","marte","jupiter","saturno","urano","neptuno"]
print(lista)

print(lista[0])
lista[0] = "vulcano"
print(lista)

print(lista[1][0:3])
#Recorrer a través de los indices
for i in range(len(lista)):
    print(lista[i],end=" ")
print()
#Forma iterativa
for elm in lista:
    print(elm,end=" ")