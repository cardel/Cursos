"""
Carlos A Delgado
16 de Junio de 2022
Ejemplo de edición de dataframes
"""
import numpy as np
import pandas as pd

df = pd.DataFrame(np.arange(12).reshape([4, 3]),
index = ["a", "b", "c", "d"],
columns = ["A", "B", "C"])
print(df)

df.iloc[1, 2] = -1 
print(df)

df["A"] = [10,20,30,40]
print(df)

df.loc["b":"c","A":"B"] = [[1,3],[4,6]]
print(df)

df.loc["b":"c","A":"B"] = -5
print("previo al intercambio")
print(df)
print("Intercambio")
df.loc[:,["A","B"]] = df.loc[:,["B","A"]].values
print(df)

print(df.where(df % 2==0,-1))

print(df.drop(["a","c"],axis=0)) #axis = 0 filas, axis = 1 son columnas
print(df.drop(["A","C"],axis=1))