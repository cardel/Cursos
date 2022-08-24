"""
Carlos A Delgado
15 de jun de 2022
Ejemplos de selección con dataframes
"""
import pandas as pd
import numpy as np

ventas = pd.DataFrame({
    "Entradas":[41, 32, 56, 18],
    "Salidas":[17, 54, 6, 78],
    "Valoración": [66, 54, 49, 66],
    "Límite": ["No", "Si", "No", "No"],
    "Cambio": [1.43, 1.16, -0.67, 0.77]},
    index = ["Ene", "Feb", "Mar", "Abr"])

print(ventas)
print(ventas["Entradas"])
print(ventas["Entradas"]["Mar"])
print(ventas.Entradas)
#ventas["Prueba"] = 1
#print(ventas)

ventas["Pérdidas"] = pd.Series([5, 4, 6, 8], index = ["Ene", "Mar", "Abr","May"])
print(ventas)
ventas["Ganancias"] = (ventas["Entradas"]*2) - (ventas["Valoración"]/10)
print(ventas)

print("Segundo ejemplo")
df = pd.DataFrame(np.arange(18).reshape([6, 3]),
index = ["a", "b", "c", "d", "d", "f"],
columns = ["A", "B", "C"])
print(df)

print(df[2:5])
print(df["b":"d"])

print(df[["C", "A"]])
print(df.loc["d"])
print(df.loc[["c","a","f"]])
print(df.loc[["c"]])
