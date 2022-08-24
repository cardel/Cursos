import math
class HashString:
    def __init__(self,m):
        self.tabla = {}
        self.m = m
        self.ascii = 128
        for i in range(0,self.m):
            self.tabla[i] = []


    def insertar(self,key,value):
        keynum = 0
        for i in range(0,len(key)):
            base = self.ascii**(len(key)-1-i)
            keynum += ord(key[i])*base
        pos = keynum % self.m
        self.tabla[pos].append((key,value))

    def busqueda(self,key):
        keynum = 0
        for i in range(0,len(key)):
            base = self.ascii**(len(key)-1-i)
            keynum += ord(key[i])*base
        pos = keynum % self.m
        for k,v in self.tabla[pos]:
            if k == key:
                return v

        return False

    def eliminar(self,key):
        keynum = 0
        for i in range(0,len(key)):
            base = self.ascii**(len(key)-1-i)
            keynum += ord(key[i])*base
        pos = keynum % self.m
        for k,v in self.tabla[pos]:
            if k == key:
                self.tabla.remove((k,v))