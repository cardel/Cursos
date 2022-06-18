"""
Carlos A Delgado
16 de Junio de 2022
Formación de datasets desde series
"""
import numpy as np
import pandas as pd

s = pd.Series([1, 2, 3, 4, 5,], index = ["a", "b", "c", "d", "e"])
r = pd.Series([10, 11, 12], index = ["f", "g", "h"])
print(s)
print(r)

t = pd.concat([s,r])
print(t)

a = pd.Series([1, 2, 3, 4, 5,], index = ["a", "b", "c", "d", "e"])
b = pd.Series([10, 11, 12], index = ["a", "b", "f"])

q = pd.concat([a,b],axis=1,sort=True)
print(q)

a = pd.Series([1, 2, 3, 4, 5], index = ["a", "b", "c", "d", "e"])
b = pd.Series([10, 11, 12], index = ["f", "g", "h"])
c = a.append(b)
print(c)

df1 = pd.DataFrame(np.arange(9).reshape([3, 3]),
index = ["a", "b", "d"],
columns = ["A", "B", "C"])

df2 = pd.DataFrame(np.arange(12).reshape([4, 3]),
index = ["a", "b", "c", "e"],
columns = ["B", "C", "D"])

print(df1)
print(df2)

print(df1.append(df2))

print(pd.concat([df1,df2]))