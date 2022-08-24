"""
Carlos A Delgado
14 de Mayo de 2022
"""
import numpy as np

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


def dfs_left(arbol):
    pila = []
    pila.append(arbol) #Añado la raiz
    recorrido = []
    while len(pila) > 0:
        nodo = pila.pop(-1)
        recorrido.append(nodo.key)
        
        if nodo.right != None:
            pila.append(nodo.right)

        if nodo.left != None:
            pila.append(nodo.left)


    return recorrido

def dfs_right(arbol):
    pila = []
    pila.append(arbol) #Añado la raiz
    recorrido = []
    while len(pila) > 0:
        nodo = pila.pop(-1)
        recorrido.append(nodo.key)

        if nodo.left != None:
            pila.append(nodo.left)
        
        if nodo.right != None:
            pila.append(nodo.right)


    return recorrido


objArbol = Arbol(
    1,
    Arbol(2,
        Arbol(4,
            Arbol(8,None,None),
            Arbol(9,None,None)
        ),
        Arbol(5,
            Arbol(10,None,None),
            Arbol(11,None,None)
        )
    ),
    Arbol(3,
        Arbol(6,
            None,
            Arbol(13,None,None)
        ),
        Arbol(7,
            Arbol(14,None,None),
            None
        )
    )
)

print(bfs(objArbol))
print(dfs_left(objArbol))
print(dfs_right(objArbol))