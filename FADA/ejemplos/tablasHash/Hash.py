import math
class Hash:
    def __init__(self,m):
        self.tabla = {}
        self.m = m
        for i in range(0,self.m):
            self.tabla[i] = []

    def insertar(self,key,value):
        pos = key % self.m
        self.tabla[pos].append((key,value))

    def busqueda(self,key):
        pos = key % self.m
        for k,v in self.tabla[pos]:
            if k == key:
                return v

        return False

    def eliminar(self,key):
        pos = key % self.m
        for k,v in self.tabla[pos]:
            if k == key:
                self.tabla.remove((k,v))