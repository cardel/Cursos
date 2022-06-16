"""
Carlos A Delgado
15 de Junio de 2022
Ejemplo de manipulación de datos con pandas
"""
import pandas as pd
import numpy as np

entradas = pd.Series([11, 18, 12, 16, 9, 16, 22, 28, 31, 29, 30, 12],
index = ["ene", "feb", "mar", "abr", "may", "jun", "jul","ago","sep", "oct", "nov", "dic"])
print(entradas)
salidas = pd.Series([9, 26, 18, 15, 6, 22, 19, 25, 34, 22, 21, 14],
index = ["ene", "feb", "mar", "abr", "may", "jun", "jul","ago","sep", "oct", "nov", "dic"])
print(salidas)

datos = pd.DataFrame({"entrada":entradas,"salida":salidas})
print(datos)

print(datos.head())

datos["promedio"] = (datos["entrada"]+datos["salida"])/2
print(datos.head())
print(datos)

datos["diferencia"] = abs(datos["entrada"]-datos["salida"])
print(datos.head())
print(datos)

datos["nuevo"] = [1,2,3,4,5,6,7,8,9,10,11,12]
print(datos.head())
print(datos)
print(datos.tail())
print("**********")
print(datos.sample(5))
print("**********")
print(datos.head(2))
print("**********")
print(datos.describe())
print("**********")
print(datos.info())
print("***************")
print(datos["entrada"].value_counts())

s = pd.Series([3, 1, 2, 1, 1, 4, 1, 2, np.nan])
print(s)
print(s.value_counts())
print(s.value_counts(dropna=False))
print(s.value_counts(bins = 6))


edades = pd.Series([12,20,23,40,49,0,2,3,5,6,9,18,19,20,22,20,20,20])
print(edades.value_counts(bins=6))

#Acceso a las series

s = pd.Series([10, 20, 30, 40], index = ["a", "b", "c", "d"])
print(s[1:3]) #No incluye el ultimo
print(s["a":"c"]) #Incluye el ultimo por no ser numérico
"""
Este retorna desde la posición de a hasta la posición de c INCLUYENDOLAS (Excepción)
"""

s = pd.Series([10, 20, 30, 40], index = ["a", "b", "c", "d"])
print(s["b":"d"])

s = pd.Series([10, 20, 30, 40], index = [3, 2, 1, 0])
print(s)
print(s[0]) #Etiqueta
print(s[0:3]) #Posicionalmente

s = pd.Series([10, 20, 30, 40], index = ["a", "b", "c", "d"])
print(s)
print(s[[3, 1,1,1,1]])