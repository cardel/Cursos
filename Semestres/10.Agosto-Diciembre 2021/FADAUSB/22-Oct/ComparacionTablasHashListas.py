import HashString
import datetime

lista = []

tabla = HashString.HashString(200)

lista = [line.rstrip('\n') for line in open('nombres.txt')]
for l in lista:
    tabla.insertar(l,l)

print("palabras ",len(lista))
inicio = datetime.datetime.now()
tabla.busqueda("perrosky")
final = datetime.datetime.now()
tiempof = final - inicio
print("Tiempo tabla hash",tiempof.total_seconds()*1000)

inicio = datetime.datetime.now()
for el in lista:
    if el == "perrosky":
        print("ok")
final = datetime.datetime.now()
tiempof = final - inicio
print("Tiempo lista",tiempof.total_seconds()*1000)
