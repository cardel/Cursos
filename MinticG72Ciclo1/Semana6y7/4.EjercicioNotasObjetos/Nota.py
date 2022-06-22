"""
Carlos A Delgado
21 de Junio de 2022
Clase de nota
"""

class Nota:
    def __init__(self,nota100):
        self.__nota100 = nota100
        self.__nota5 = nota100*5/100
        self.__descripcion = ""
        self.__fecha = ""

        if nota100 > 60:
            self.__notacualitativa = "Aprobado"
        else:
            self.__notacualitativa = "Reprobado"

    def setDescripcion(self,descripcion):
        self.__descripcion = descripcion
    
    def setFecha(self,fecha):
        self.__fecha = fecha
    
    def getNota5(self):
        return self.__nota5
    
    def getNota100(self):
        return self.__nota100

    def getFecha(self):
        return self.__fecha

    def getDescripcion(self):
        return self.__descripcion

    def getNotaCualitativa(self):
        return self.__notacualitativa