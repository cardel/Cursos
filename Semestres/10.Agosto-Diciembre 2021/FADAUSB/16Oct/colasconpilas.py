import Pila

#Pilas con pilas

pila = Pila.Pila(5)
pila.push(4)
pila.push(8)
pila.push(7)
print(pila.pila)

pilaAux = Pila.Pila(5)
#n-1
pilaAux.push(pila.pop())
pilaAux.push(pila.pop())
print(pilaAux.pop())

#n-1
pila.push(pilaAux.pop())
pila.push(pilaAux.pop())
print(pilaAux.pila)

import Cola

#Pilas con colas

cola = Cola.Cola(5)
cola.enqueue(4)
cola.enqueue(8)
cola.enqueue(7)
print(cola.cola)

colaAux = Cola.Cola(5)
#n-1
colaAux.enqueue(cola.dequeue())
colaAux.enqueue(cola.dequeue())
print(cola.dequeue())

#n-1
cola.enqueue(colaAux.dequeue())
cola.enqueue(colaAux.dequeue())
print(cola.cola)