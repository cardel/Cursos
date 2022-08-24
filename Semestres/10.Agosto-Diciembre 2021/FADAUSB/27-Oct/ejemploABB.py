import ABB

arbol1 = ABB.ABB(10, None,None,None)
nodo1 = ABB.ABB(5, None,None,None)
nodo2= ABB.ABB(3, None,None,None)
nodo3= ABB.ABB(7, None,None,None)
nodo4= ABB.ABB(14, None,None,None)
nodo5= ABB.ABB(12, None,None,None)
nodo6= ABB.ABB(18, None,None,None)
nodo7= ABB.ABB(15, None,None,None)
nodo8= ABB.ABB(19, None,None,None)

arbol1.hizq = nodo1
arbol1.hder = nodo4

nodo1.padre = arbol1
nodo1.hizq = nodo2
nodo1.hder = nodo3
nodo2.padre = nodo1
nodo3.padre = nodo1

nodo4.padre = arbol1
nodo4.hizq = nodo5
nodo4.hder = nodo6

nodo5.padre = nodo4

nodo6.padre = nodo4
nodo6.hizq = nodo7
nodo6.hder = nodo8

nodo7.padre = nodo6
nodo8.padre = nodo6



print(arbol1.buscar_llave(15))
print(arbol1.buscar_llave(-1))
print(arbol1.buscar_llave(7))



print(arbol1.buscar_minimo())
print(arbol1.buscar_maximo())
print("Sucesor")
print(arbol1.sucesor(10))
print(arbol1.sucesor(19)) 
print(arbol1.sucesor(7)) 
print(arbol1.sucesor(12)) 
print(arbol1.sucesor(14)) 


arbol2 = ABB.ABB(8, None,None,None)
arbol2.insertar(10)
arbol2.insertar(12)
arbol2.insertar(4)

print("arbol2")
print(arbol2.buscar_minimo())
print(arbol2.buscar_maximo())
print(arbol2.sucesor(8))
print(arbol2.sucesor(4))
print(arbol2.sucesor(12))
print(arbol2.to_string())
print(arbol1.to_string())
arbol1.insertar(1)
print(arbol1.to_string())
print("Pruebas caso 1")
arbol1.eliminar(7)
print(arbol1.to_string())

print("Pruebas caso 2")
arbol1.eliminar(3)
print(arbol1.to_string())

print("Pruebas caso 3")
arbol1.eliminar(14)
print(arbol1.to_string())
