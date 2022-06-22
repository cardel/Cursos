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
        return f"La materia {self.__nombre} del estudiante con código {self.__codigoEstudiante} que tiene {self.__creditos} créditos tiene un promedio de {self.promedio5()}"

    def getAprobo(self):
        nota5 = self.promedio5() #Esto nos retorna la nota sobre 5
        if nota5 >= 3:
            return "Aprobó"
        else:
            return "No aprobó"

    def getInformacionNotas(self):
        """
        salida = ""
        for nota in self.__notas:
            salida+=f"La nota sobre 5 es {nota.getNota5()} y la nota sobre 100 es {nota.getNota100()}\n"
        """
        salida = reduce(lambda acc,x:acc+f"La nota sobre 5 es {x.getNota5()} y la nota sobre 100 es {x.getNota100()}\n",self.__notas,"")
        return salida

