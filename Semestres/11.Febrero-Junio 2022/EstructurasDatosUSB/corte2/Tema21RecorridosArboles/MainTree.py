from Tree3 import Tree

objTree = Tree(
    "a",
    Tree(
        "b",
        Tree("d",
            Tree("j",None,None,None),
            Tree("k",None,None,None),
            None
        ),
        Tree("e",None,None,None),
        None
    ),
    Tree(
        "c",
        Tree("f",None,None,None),
        Tree("g",None,None,None),
        None),
    Tree("b",
        Tree("h",None,None,None),
        Tree("i",
            Tree("m",None,None,None),
            None,None),
        None)
)

print(objTree.preorder())
print(objTree.inororder())
print(objTree.posorder())