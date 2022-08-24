from Tree2 import Tree

objTree = Tree(
    1,
    Tree(
        2,
        Tree(4,
            Tree(8,None,None),
            Tree(9,None,None)
        ),
        Tree(
            5,
            Tree(10,None,None),
            Tree(11,None,None)
        )
    ),
    Tree(
        3,
        Tree(
            6,
            Tree(13,None,None),
            None
        ),
        Tree(
            7,
            Tree(14,None,None),
            None)
    )
)

print(objTree.preorder())
print(objTree.inororder())
print(objTree.posorder())