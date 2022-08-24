import numpy as np
class Pila:
    def __init__(self,size):
        self.top = 0
        self.arreglo = np.zeros(size)
        self.num_elements = 0
        self.size = size

    def top(self):
        if self.num_elements == 0:
            print("Pila vacia")
        else:
            return self.arreglo[self.top-1]
    
    def push(self, elemento):
        if self.top == self.size:
            print("Overflow")
        else:
            self.top+=1 #Incremento el top
            self.arreglo[self.top-1] = elemento
            self.num_elements+=1 # Incremento el número de elementos

    def pop(self):
        if self.num_elements == 0:
            print("Pila vacia underflow")
        else:
            elemento = self.arreglo[self.top-1]
            if(self.top > 0):
                self.top-=1
            self.num_elements -= 1
            return elemento