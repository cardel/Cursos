"""
Carlos A Delgado
15 de junio de 2022
Ejemplo de seleccion aleatoria de series con pandas
"""
import pandas as pd
import numpy as np

s = pd.Series([10, 20, 30, 40], index = ["a", "b", "c", "s"])
print(s.sample(2))
print(s.sample(2))
print(s.sample(frac=0.8))