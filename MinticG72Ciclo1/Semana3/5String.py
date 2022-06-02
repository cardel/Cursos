"""
Carlos A Delgado
01-junio-2022
Ejemplos sobre string
"""
cadena = "Hola_mundo"
print(cadena[0:4])
print(cadena[2:8])
print(cadena[:4])
print(cadena[2:])
print(cadena[2:3])

#Slices tambien podemos saltarnos letras (opcional)
print(cadena[0:5:2])
print(cadena[-1:-8:-1])

print(cadena[3:0:-1])

cadena2 = "Hola mundo"
#cadena2[1] = "a" falla, porque no podemos cambiar un string (inmutable)
cadena2 = cadena2[0]+"a"+cadena2[2:] #Reconstruirla, volverla a hacer
print(cadena2)

