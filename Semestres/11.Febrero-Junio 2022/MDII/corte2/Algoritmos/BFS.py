"""
Carlos A Delgado S
14 de mayo de 2021
"""
from Arbol import Arbol

def bfs(arbol):
    cola = []
    cola.append(arbol) #Añado la raiz
    recorrido = []
    while len(cola) > 0:
        nodo = cola.pop(0)
        recorrido.append(nodo.key)

        if nodo.left != None:
            cola.append(nodo.left)
        
        if nodo.right != None:
            cola.append(nodo.right)

    return recorrido

objArbol = Arbol(
    5,
    Arbol(6,
        Arbol(
            8,
            Arbol(15,None,None),
            Arbol(13,None,None)
        ),
        Arbol(9,None,None)
    ),
    Arbol(
        7,
        Arbol(10,None,None),
        Arbol(11,None,None)
    )
)
print(bfs(objArbol))