txt = "but soft what light in yonder window breaks"
palabras = txt.split() #convierte el contenido de 'txt' en una lista de palabras
print(palabras)

l = list()
for subcadena in palabras:
    l.append((len(subcadena), subcadena)) #crea una lista de tuplas (longitudPalabra, palabra)
print(l)