import Cola

objCola = Cola.Cola(5)
print(objCola.array,objCola.head, objCola.tail)

objCola.dequeue()

objCola.enqueue(5)
objCola.enqueue(8)
objCola.enqueue(10)
objCola.enqueue(2)
print(objCola.array,objCola.head, objCola.tail)
objCola.enqueue(23)
print(objCola.array,objCola.head, objCola.tail)

objCola.dequeue()
print(objCola.array,objCola.head, objCola.tail)

objCola.enqueue(230)
print(objCola.array,objCola.head, objCola.tail)
