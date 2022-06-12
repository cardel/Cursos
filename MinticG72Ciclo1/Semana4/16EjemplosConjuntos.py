"""
Carlos A Delgador
10 de Junio de 2022
Ejemplo de conjuntos
"""
conjunto = {"P1","P61","P62","P63","P64","P65","P66"}
print(conjunto)

for elm in conjunto:
    print(elm)

conjunto.add("P72")
print(conjunto)

conjunto.remove("P1")
print(conjunto)

