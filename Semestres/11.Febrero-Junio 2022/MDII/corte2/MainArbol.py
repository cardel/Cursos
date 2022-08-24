from Arbol import Arbol


arbolObj = Arbol(
    1,
    Arbol(
        2,
        Arbol(4,None,None),
        Arbol(5,None,None),
    ),
    Arbol(3,
        Arbol(6,None,None),
        Arbol(7,None,None),
    )
)

arbolObj2 = Arbol(
    1,
    Arbol(
        7,
        Arbol(2,None,None),
        Arbol(
            6,
            Arbol(5,None,None),
            Arbol(11,None,None),
            )
        ),
    Arbol(
        9,
        None,
        Arbol(
            9,
            Arbol(5,None,None),
            None
        )
    )
)

print(arbolObj2.preorder())
print(arbolObj2.inorder())
print(arbolObj2.posorder())