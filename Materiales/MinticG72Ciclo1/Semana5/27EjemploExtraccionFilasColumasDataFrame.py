"""
Carlos A Delgado
15 de junio de 2022
Ejemplo de extracción de filas y columnas de un DataFrame
Material UTIL para el reto 5.
"""
import numpy as np
import pandas as pd

df = pd.DataFrame(np.arange(18).reshape([6, 3]),
            index = ["a", "b", "c", "d", "e", "f"],
            columns = ["A", "B", "C"])
print(df)
#Recordar que loc usa son ETIQUETAS
print(df.loc["a", "C"]) #EL primer parametro es la fila y el segundo la columna
print(df.loc[:,"C"]) #Extraer toda una columna
print(df.loc[:,["A","B","B"]])
print(df.loc[:,"A":"C"])
print(df.loc["a",:])
print(df.loc["a":"c",:])
print(df.loc[["a","c","d","d"],:])

#Vamos con iloc (indices numéricos)
print(df.iloc[0,0])
print(df.iloc[0,:])
print(df.iloc[[0,1],:])
print(df.iloc[[0,1,1],:])
print(df.iloc[:,1])
print(df.iloc[:,1:3])
print(df.iloc[:,[1,2,1,1,1]])