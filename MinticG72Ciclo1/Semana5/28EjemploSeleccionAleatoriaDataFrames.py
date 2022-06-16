"""
Carlos A Delgado
15 de Junio de 2022

Recordar que quede empezando:
35 Edición de series
"""
import numpy as np
import pandas as pd

df = pd.DataFrame(np.arange(18).reshape([6, 3]),
index = ["a", "b", "c", "d", "e", "f"],
columns = ["A", "B", "C"])

#Obtener indices de columnas
print(df)
print(df.columns.get_loc("B"))
print(df.columns.get_indexer(["A", "C"]))

#Obtener indices de filas
print(df.index.get_loc("d"))
print(df.index.get_indexer(["c", "e"]))

mask = [True, False, True, False, False, True]
print(df[mask])
print(df[df.A > 7])
print(df[df.loc[:,"A"]>7])
print(df.iloc[(df.B > 6 ).values])

print(df.sample(2))

df.pop("B")
print(df)
