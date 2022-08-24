from Arbol import Arbol

objArbol = Arbol(
    "a",
    Arbol("b",
        Arbol("d",None,None),
        Arbol("e",None,None),
    ),
    Arbol(
        "c",
        Arbol("f",None,None),
        Arbol("g",Arbol("k",None,None),None)
    )
)

print(objArbol.key)