"""
Carlos A Delgado S
14 de mayo de 2021
"""
from Arbol import Arbol

def dfs(arbol):
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
print(dfs(objArbol))