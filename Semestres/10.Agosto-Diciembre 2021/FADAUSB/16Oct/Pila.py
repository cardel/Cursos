class Pila:
    def __init__(self,n):
        self.size = n
        self.pila = [None]*n
        self.top = 0

    def emptyStack(self):
        if self.top == 0:
            return True
        else:
            return False

    def push(self,x):
        if self.top == self.size:
            return "Overflow"
        else:
            self.top += 1
            self.pila[self.top-1] = x
            

    def pop(self):
        if self.top == 0:
            return "Underflow"
        else:
            a = self.pila[self.top-1]
            self.pila[self.top-1] = None
            self.top -= 1
            return a

"""
pila = Pila(5)
print(pila.pila)   
pila.push(5)
print(pila.pila)   
pila.push(4)
print(pila.pila)   
pila.push(3)
print(pila.pila)
print(pila.pop())
print(pila.pila)   
print(pila.pop()) 
print(pila.pila)        
pila.push(3)
pila.push(40)
print(pila.pila)
"""