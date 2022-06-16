"""
Carlos A Delgado
15 de Junio de 2022
Ejemplo de creación de Dataframes
"""
import pandas as pd

datos = {
    "Cali": [30.2,29.8,33.6,44.5,19.8,30.1],
    "Bogotá":[22.3,11.4,24.2,20.9,19.4,18.4],
    "Pereira":[25.4,23.2,21.2,20.4,25.2,24.1]
}

df = pd.DataFrame(data=datos)
print(df)
print(df.index)
print(df.columns)
df.index = ["Enero","Febrero","Marzo","Abril","Mayo","Junio"]
print(df)

print(df["Cali"])
print(df["Cali"]["Febrero"])
print(df["Pereira"]["Febrero"])
print(df.shape)

