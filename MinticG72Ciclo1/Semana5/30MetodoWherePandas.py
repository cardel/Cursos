"""
Carlos A Delgado
16 de Junio de 2022
Ejemplo de uso de where en series de pandas
"""
import numpy as np
import pandas as pd

s = pd.Series(np.arange(0, 10))
print(s)
print(s.where(s % 2 == 0,-1))