"""
Carlos A Delgado
21 de Junio de 2022
Ejercicio de notas en O.O (Orientado a objetos)
"""
from Materia import Materia
from Nota import Nota

objMateria1 = Materia(
    "Fundamentos de programación",
    1,
    "Carlos Delgado",
    [Nota(60),Nota(100),Nota(80),Nota(60),Nota(90)],
    3,
    "ABC134"
)

print(objMateria1.getInformacion())
print(objMateria1.promedio5())
print(objMateria1.promedio100())
print(objMateria1.getAprobo())
print(objMateria1.getInformacionNotas())

objMateria2 = Materia(
    "Fundamentos de programación",
    1,
    "Carlos Delgado",
    [Nota(50),Nota(40),Nota(50),Nota(30),Nota(10)],
    3,
    "FDC323"
)

print(objMateria2.getInformacion())
print(objMateria2.promedio5())
print(objMateria2.promedio100())
print(objMateria2.getAprobo())
print(objMateria2.getInformacionNotas())
