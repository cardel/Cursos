"""
Carlos A Delgado
16 de Junio de 2022
Ejemplo de lectura de archivos en python
"""

archivo = open("texto.txt","r")
lineas = archivo.readlines()
print(type(lineas))
lines1 = [s.rstrip('\n') for s in lineas] #Para eliminar los saltos de linea
print(lines1)

archivo.close()

archivo = open("texto.txt","r")

for l in archivo:
    print(l)

archivo.close()