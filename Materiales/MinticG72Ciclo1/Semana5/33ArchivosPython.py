"""
Carlos A Delgado S
Ejemplo manejo de archivos en Python
"""

fic = open("texto.txt","r") #r es solo lectura
"""
fic = open("texto.txt","a") #Añadir información
fic = open("texto.txt","w") #Crear un archivo nuevo
"""
fic.close()

data = ["Línea 1", "Línea 2", "Línea 3", "Línea 4", "Línea 5"]
fic = open("text1.txt", "w")
for d in data:
    fic.write(d+"\n")

fic.close()

fic = open("text2.txt", "w")

data = ["Línea 1", "Línea 2", "Línea 3", "Línea 4", "Línea 5"]

for line in data:
    print(line, file=fic)
    
fic.close()

data1 = ["Don Edwin"]
data2 = ["A", "B", "C", "D", "E", "F", "G", "H"]
data = data1 + data2

fic = open("text3.txt", "w")
fic.writelines("%s\n" % s for s in data)

fic.close()