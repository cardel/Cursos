import numpy as np

class Heap:
    def __init__(self, lenght):
        self.lenght = lenght #Tamaño en memoria
        self.size = 0  #Numero elementos
        self.heap = np.array([None]*lenght)

    def hizq(self,i):
        pos = 2*i
        if pos <= self.size:
            return pos,self.heap[pos-1]
        else:
            return None,None

    def hder(self,i):
        pos = 2*i+1
        if pos <= self.size:
            return pos,self.heap[pos-1]
        else:
            return None,None
    
    def padre(self,i):
        pos = i//2
        if i>0:
            return pos,self.heap[pos-1]
        else:
            return None,None

    def heapfy(self,i):
        posizq,vaizq = self.hizq(i)
        posder,vader = self.hder(i)
        raiz = self.heap[i-1]

        if vaizq != None and vader != None:
            if vaizq > vader and vaizq > raiz:
                self.heap[i-1],self.heap[posizq-1] = self.heap[posizq-1],self.heap[i-1]
                self.heapfy(posizq)
            elif vader > vaizq and vader > raiz:
                self.heap[i-1],self.heap[posder-1] = self.heap[posder-1],self.heap[i-1]
                self.heapfy(posder) 
            else:
                return
        elif vaizq != None and vader == None:
            if vaizq > raiz:
                self.heap[i-1],self.heap[posizq-1] = self.heap[posizq-1],self.heap[i-1]
                self.heapfy(posizq)   
            else:
                return
        else:
            return

    def build_heap(self,A):
        if A.shape[0]>self.lenght:
            print("El arreglo no cabe en monticulo")
        else:
            #Pasar los datos de A al monticulo
            # O(n) donde n es el número de elemtnos de a
            self.size = A.shape[0]
            for i in range(0,A.shape[0]):
                self.heap[i] = A[i]

            #Aplicamos n/2 veces heapfy
            for i in range(self.size//2,0,-1):
                self.heapfy(i)


    def heapSort(self,A):
        if A.shape[0]>self.lenght:
            print("El arreglo no cabe en monticulo")
        else:
            self.build_heap(A)
            
            for i in range(0,A.shape[0]):
                self.heap[0],self.heap[self.size-1] = self.heap[self.size-1],self.heap[0]
                self.size -= 1
                self.heapfy(1)