import pandas as pd

serie1 = pd.Series([33.5,22.3,13.1], index=["Cali", "Pereira", "Bogotá"])
print(serie1)

serie2 = pd.Series([10000,20000,15000])
print(serie2)

print(serie1["Cali"])
print(serie2[0])

print(serie1.index) #Extraer las llaves
print(serie1.values) #Extraer los valores
print(serie2.index) #Extraer las llaves
print(serie2.values) #Extraer los valores

serie1.name = "Temperaturas en las ciudades"
print(serie1)
serie1.index.name = "Ciudades"
print(serie1)

print(serie1.shape)