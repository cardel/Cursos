import numpy as np
class Cola:
    def __init__(self,size):
        self.head = 0 #Cabeza
        self.tail = 1 #Cola
        self.num_elements = 0
        self.array = np.zeros(size)
        self.size = size

    def enqueue(self,elemento):
        if self.num_elements < self.size:
            self.array[self.tail-1] = elemento
            self.num_elements += 1
            if(self.tail==self.size):
                self.tail = 1
            else:
                self.tail += 1

            if self.num_elements == 0:
                self.head = 1
        else:
            print("Overflow")

    def dequeue(self):
        if self.num_elements == 0:
            print("Underflow")
        else:
            elemento = self.array[self.head-1]
            
            if(self.head == self.size):
                self.head = 1
            else:
                self.head+=1

            self.num_elements-=1
            return elemento