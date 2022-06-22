"""
Carlos A Delgado
21 de Junio de 2022
Clase que implementa las materias
"""
from functools import reduce
from Nota import Nota

class Materia:
    def __init__(self,nombre,semestre,docente,notas,creditos,codigoEstudiante):
        self.__nombre = nombre
        self.__semestre = semestre
        self.__codigoEstudiante = codigoEstudiante
        self.__docente = docente
        self.__notas = notas
        self.__creditos = creditos

    def promedio5(self):
        suma = reduce(lambda acc,x: acc+x.getNota5(),self.__notas,0)
        minimo = min(list(map(lambda x: x.getNota5(),self.__notas)))   
        return round((suma-minimo)/4,2)

    def promedio100(self):
        suma = reduce(lambda acc,x: acc+x.getNota100(),self.__notas,0)
        minimo = min(list(map(lambda x: x.getNota100(),self.__notas)))   
        return round((suma-minimo)/4,2)

    def getInformacion(self):
        return f"La materia {self.__nombre} del estudiante con código {self.__codigoEstudiante} que tiene {self.__creditos} tiene un promedio de {self.promedio5()}"

