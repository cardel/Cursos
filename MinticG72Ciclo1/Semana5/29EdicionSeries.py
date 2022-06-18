"""
Carlos A Delgado
16 de Junio de 2022
Ejemplo de edición en pandas
"""
import numpy as np
import pandas as pd

s = pd.Series([1, 2, 3, 4, 5], index = ["a", "b", "c", "d", "e"])
print(s)

s["a"] = 3
print(s)

s[0] = 9
print(s)

s["a":"d"] = -1
print(s)

s[0:3] = -4
print(s)

s["a":"d"] = [1.3,3,8,9]
print(s)

s[0:3] = ["Carlos","Juan","Pedro"]
print(s)

s["f"] = 29
print(s)

s[["a","b","c"]] = [1,2,3]
print(s)

s[[2,3,4]] = [10,20,30]
print(s)

s.pop("f") #Metodo inplace (edita el dato)
print(s)

k = s.drop(["a","c"]) #Metodo que retorna un valor que es la serie con el elemento eliminado
print(s)
print(k)

s = pd.Series([1, 2, 3, 4, 5], index = ["a", "b", "c", "d", "e"])
print(s.index[[1,3,4]])