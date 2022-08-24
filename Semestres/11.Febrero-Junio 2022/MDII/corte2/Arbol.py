class Arbol:
    def __init__(self,key,left,right):
        self.key = key
        self.left = left
        self.right = right

    

    def preorder(self):
        salida = []
        salida.append(self.key)

        if self.left != None:
            salidaL = self.left.preorder()
            for e in salidaL:
                salida.append(e)

        if self.right != None:
            salidaR = self.right.preorder()

            for e in salidaR:
                salida.append(e)

        return salida

    def inorder(self):
        salida = []


        if self.left != None:
            salidaL = self.left.inorder()
            for e in salidaL:
                salida.append(e)

        salida.append(self.key)

        if self.right != None:
            salidaR = self.right.inorder()

            for e in salidaR:
                salida.append(e)

        return salida       


    def posorder(self):
        salida = []


        if self.left != None:
            salidaL = self.left.posorder()
            for e in salidaL:
                salida.append(e)
        
        if self.right != None:
            salidaR = self.right.posorder()

            for e in salidaR:
                salida.append(e)

        salida.append(self.key)

        return salida       