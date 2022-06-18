"""
Carlos A Delgado
17 de Junio de 2022
Ayuda para el reto 5
"""
import pandas as pd

rutaFileCsv = "https://github.com/luisguillermomolero/MisionTIC2022_2/blob/master/Modulo1_Python_MisionTIC2022_Main/Semana_5/Reto/movies.csv?raw=true"

def listaPeliculas(ruta):
    if ruta.split(".")[-1].split("?")[0] == "csv":
        try:
            datos = pd.read_csv(ruta)
            subconjunto = datos[["Country", "Language","Gross Earnings"]]
            salida = pd.pivot_table(subconjunto, index=['Country', 'Language']).head(10)
            print(salida)
            return salida
        except:
            print("Error al leer el archivo de datos")
    else:
        return "Extensión inválida"

print(listaPeliculas(rutaFileCsv))