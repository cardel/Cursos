class Tree:
    def __init__(self, key, left, right1, right2):
        self.key = key
        self.left = left
        self.right1 = right1
        self.right2 = right2

    def preorder(self):
        salida, leftL, right1L, right2L = [], [], [], []
        salida.append(self.key)
        if(self.left != None):
            leftL = self.left.preorder()
        if(self.right1 != None):
            right1L = self.right1.preorder()
        if(self.right2 != None):
            right2L = self.right2.preorder()

        for l in leftL:
            salida.append(l)

        for r1 in right1L:
            salida.append(r1)

        for r2 in right2L:
            salida.append(r2)

        return salida

    def inororder(self):
        salida, leftL, right1L, right2L = [], [], [], []

        if(self.left != None):
            leftL = self.left.inororder()

        for l in leftL:
            salida.append(l)

        salida.append(self.key)

        if(self.right1 != None):
            right1L = self.right1.inororder()
        if(self.right2 != None):
            right2L = self.right2.inororder()

        for r1 in right1L:
            salida.append(r1)

        for r2 in right2L:
            salida.append(r2)

        return salida

    def posorder(self):
        salida, leftL, right1L, right2L = [], [], [], []

        if(self.left != None):
            leftL = self.left.posorder()

        for l in leftL:
            salida.append(l)

        
        if(self.right1 != None):
            right1L = self.right1.posorder()
        if(self.right2 != None):
            right2L = self.right2.posorder()

        for r1 in right1L:
            salida.append(r1)

        for r2 in right2L:
            salida.append(r2)

        salida.append(self.key)

        return salida
