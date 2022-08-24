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

#
cola.enqueue(colaAux.dequeue())
cola.enqueue(colaAux.dequeue())
print(cola.cola)