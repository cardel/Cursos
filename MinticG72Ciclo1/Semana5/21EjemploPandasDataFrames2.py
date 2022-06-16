"""
Carlos A Delgado
15 de Junio de 2022
Ejemplo de dataframes
"""

import pandas as pd
import numpy as np

elementos = {
    "Numero atómico":[1, 6, 47, 88],
    "Masa atómica":[1.008, 12.011, 107.87, 226],
    "Familia":["No metal", "No metal", "Metal", "Metal"]
}
df = pd.DataFrame(elementos,
    index = ["H", "C", "Ag", "Ra"],
)


print(df)
print(df[["Numero atómico","Masa atómica"]])
print(df[["Numero atómico","Masa atómica"]])

unidades_Datos = np.array([[2, 5, 3, 2],
[4, 6, 7, 2],
[3, 2, 4, 1]])
print(unidades_Datos)

unidades = pd.DataFrame(unidades_Datos)
print(unidades)

unidades = pd.DataFrame(unidades_Datos, index = [2015, 2016, 2017], columns =["Ag", "Au", "Cu", "Pt"])
print(unidades)
unidades_2015 = {"Ag":2, "Au":5, "Cu":3, "Pt":2}
unidades_2016 = {"Ag":4, "Au":6, "Cu":7, "Pt":2}
unidades_2017 = {"Ag":3, "Au":2, "Cu":4, "Pt":1}
unidades = pd.DataFrame([unidades_2015, unidades_2016, unidades_2017],index = [2015, 2016, 2017])
print(unidades)


unidades_2015 = {"Ag":2, "Au":5, "Cu":3, "Pt":2}
unidades_2016 = {"Ag":4, "Au":6, "Cu":7, "Pt":2}
unidades_2017 = {"Ag":3, "Pb":2, "Cu":4, "Pt":1}
unidades = pd.DataFrame([unidades_2015, unidades_2016, unidades_2017],
index = [2015, 2016, 2017])
print(unidades)

