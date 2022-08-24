"""
Diseñar una función que permita

1) Solicite el número de ciudades
2) Genere una lista con las ciudades
3) Genere una lista con las temperaturas

4) Me retorne el nombre y la temperatura de las ciudades con mayor y menor temperatura (se garantiza las temperaturas son diferentes)

Cartagena 44
Manizales 18
Pereira 20
Cali 39
Cucuta 50

Retornar str "La ciudad más calida es Cucuta con 50 grados y la más fria es Manizales con 18 grados"
"""
def temperaturas_ciudades(n):
    ciudades = [] #Creamos la lista vacía para las ciudades
    temperaturas = [] #Creamos la lista vacía para las temperaturas
    #Procedemos a insertar los datos
    for i in range(n):
        ciudad = input("Ingrese la ciudad ")
        temperatura = float(input("Ingrese la temperatura de la ciudad "+ciudad+" "))
        ciudades.append(ciudad)
        temperaturas.append(temperatura)

    #Determinar las ciudades con mayor y menor temperatura
    min_ciudad = ciudades[0]
    min_temperatura = temperaturas[0]
    max_ciudad = ciudades[0]
    max_temperatura = temperaturas[0]

    for i in range(len(temperaturas)):
        if temperaturas[i]<min_temperatura: #Si el minimo encontrado es menor que el que llevamos
            min_ciudad = ciudades[i]
            min_temperatura = temperaturas[i]
        
        if temperaturas[i]>max_temperatura: #Si el maximo encontrado es mayor al que llevamos
            max_ciudad = ciudades[i]
            max_temperatura = temperaturas[i]

    return f"La ciudad más cálida es {max_ciudad} con {max_temperatura} grados y la más fria es {min_ciudad} con {min_temperatura} grados"

n = int(input("Ingrese el número de ciudades "))
print(temperaturas_ciudades(n))