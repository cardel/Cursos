import math
import numpy as np

class Heap:
    def __init__(self,size=0):
        if size > 0:
            self.size = size
            self.monticulo = np.array([None]*size)

    def padre(self,i):
        pos = math.floor(i/2)
        return self.monticulo[pos-1]

    def hijIzq(self,i):
        pos = math.floor(2*i)
        if pos <= self.size:
            return pos,self.monticulo[pos-1]
        else:
            return None,None

    def hijDer(self,i):
        pos = math.floor(2*i+1)
        if pos <= self.size:
            return pos,self.monticulo[pos-1]
        else:
            return None,None

    def heapify(self, pos):
        """
        pos: 1 ... n
        """
        raiz = self.monticulo[pos-1]
        posIzq,izq = self.hijIzq(pos)
        posDer,der = self.hijDer(pos)

        if izq != None and der !=None:
            if izq >= der and izq > raiz:
                print("ok")
                self.monticulo[pos-1],self.monticulo[posIzq-1] = self.monticulo[posIzq-1],self.monticulo[pos-1]
                self.heapify(posIzq)
            if der > izq and der > raiz:
                self.monticulo[pos-1],self.monticulo[posDer-1] = self.monticulo[posDer-1],self.monticulo[pos-1]
                self.heapify(posDer) 
        elif izq != None and der == None:
            if izq > raiz:
                self.monticulo[pos-1],self.monticulo[posIzq-1] = self.monticulo[posIzq-1],self.monticulo[pos-1]
                self.heapify(posIzq)  
        else:
            return  

    def build_monticulo(self,arreglo):
        self.monticulo = arreglo
        self.size = arreglo.shape[0] #Numero de elementos

        for i in range(self.size//2+1,0,-1):
            self.heapify(i)

    def heap_sort(self,arreglo):
        self.build_monticulo(arreglo)

        for i in range(0,len(arreglo)):
            #Intercambio
            if self.size > 1:
                self.monticulo[0],self.monticulo[self.size-1] = self.monticulo[self.size-1],self.monticulo[0]
                self.size-=1 #Decrementamos el tamaño del monticulo
                self.heapify(1)
        
        return self.monticulo