"""
Carlos A Delgado
15 de Junio de 2022
Ejemplo de uso de loc
"""
import pandas as pd
import numpy as np

#loc funciona con etiquetas no acepta indices numéricos
s = pd.Series([10, 20, 30, 40], index = ["a", "b", "c", "b"])
print(s)
print(s.loc["b"])
#iloc es como si fuera un arreglo de numpy (directamente con índices)
s = pd.Series([10, 20, 30, 40], index = ["a", "b", "c", "d"])
print(s)
print(s.loc[["d","a"]])
print(s.iloc[1])
print(s.iloc[[1,0,1]])
print(s.iloc[-1])
print(s.iloc[1:3])

s = pd.Series([5, 2, -3, 7, 8, 4])
print(s)
print(s[[True, False, False, True, True, False]]) #Funciona igual que filter

print(s > 2)
print(s[s>2]) #Filtro
print(list(filter(lambda x: x>2,[5, 2, -3, 7, 8, 4]))) #Filtro

print(s.loc[[True, False, False, True, True, True]])
print(s.iloc[[True, False, False, True, True, True]])
print(s.loc[s>2])
#print(s.iloc[s>2])
