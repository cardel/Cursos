"""
Autor: Carlos Delgado
Fecha: 24-03-2022
Descripción: Tabla Hash cuya llave es un string
"""
import math
class HashTable:
    def __init__(self,size,method):
        self.size = size
        self.method = method
        self.table = []
        for i in range(size):
            self.table.append([])

    def add(self,key,value):
        key_value = math.floor(self.getStringValue(key))
        pos = self.div_method(key_value) if self.method else self.mult_method(key_value)


        self.table[pos].append([key,value])

    def getValue(self,key):
        key_value = math.floor(self.getStringValue(key))
        pos = self.div_method(key_value) if self.method else self.mult_method(key_value)

        elm = self.table[pos]
        for e in elm:
            if(e[0]==key):
                return e[1]

        return None


    def getStringValue(self,value):
        final_value = 0
        exp = len(value)-1
        for v in value:
            final_value+=ord(v)*(128**exp)
            exp=-1
    
        return final_value

    def div_method(self,key):
        return key%self.size
    
    def mult_method(self,key):
        A = 0.610803
        return math.floor(self.size*((key*A)%1))