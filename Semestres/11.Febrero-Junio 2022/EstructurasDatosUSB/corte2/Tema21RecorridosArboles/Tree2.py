class Tree:
    def __init__(self,key,left,right):
        self.key = key
        self.left = left
        self.right = right

    def preorder(self):
        salida, leftL, rightL = [], [], []
        salida.append(self.key)
        if(self.left != None):
            leftL = self.left.preorder()
        if(self.right != None):
            rightL = self.right.preorder()

        for l in leftL:
            salida.append(l)

        for r1 in rightL:
            salida.append(r1)


        return salida

    def inororder(self):
        salida, leftL, rightL = [], [], []

        if(self.left != None):
            leftL = self.left.inororder()

        for l in leftL:
            salida.append(l)

        salida.append(self.key)

        if(self.right != None):
            rightL = self.right.inororder()

        for r1 in rightL:
            salida.append(r1)

        return salida

    def posorder(self):
        salida, leftL, rightL = [], [], []

        if(self.left != None):
            leftL = self.left.posorder()

        for l in leftL:
            salida.append(l)

        
        if(self.right != None):
            rightL = self.right.posorder()

        for r1 in rightL:
            salida.append(r1)


        salida.append(self.key)

        return salida
    