
lista1 = [1,2,3,"Carlos","Delgado",True]

lista2 = [1,4,2,1,3,2,3,-1,2]
lista2.sort() #Operación in place // in situ (en la estructura)

lista3 = lista2.copy() #Error lista3 = lista2 porque siguen siendo las mismas!!!
print(lista2,lista3)
lista3[0] = 10000
print(lista2,lista3)


lista4 = [1,2,3,4,5,6,7,8]

def modificarLista(lista):
    lista5 = lista[:]
    lista5[0] = int(input("Ingrese un número"))

print(lista4)
modificarLista(lista4)
print(lista4)