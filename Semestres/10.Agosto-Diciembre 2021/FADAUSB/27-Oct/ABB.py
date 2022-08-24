class ABB:
    def __init__(self,valor,hizq,hder, padre):
        self.valor = valor
        self.hizq = hizq
        self.hder = hder
        self.padre = padre

    def buscar_llave(self,valor,arbol = None):
        if arbol == None:
            arbol = self
        if arbol.valor == valor:
            return True
        elif arbol.valor <= valor and arbol.hder != None:
            return self.buscar_llave(valor,arbol.hder)
        elif arbol.valor > valor and arbol.hizq != None:
            return self.buscar_llave(valor,arbol.hizq)
        else:
            return False

    def buscar_minimo(self, arbol = None):
        if arbol == None:
            arbol = self
        
        if arbol.hizq == None:
            return arbol.valor
        else:
            return self.buscar_minimo(arbol.hizq)

    def buscar_maximo(self,arbol = None):
        if arbol == None:
            arbol = self
        if arbol.hder == None:
            return arbol.valor
        else:
            return self.buscar_maximo(arbol.hder)

    def sucesor(self,valor,arbol=None):
        if arbol == None:
            arbol = self
            
        if arbol.valor == valor:
            
            if arbol.hder != None:
                return self.buscar_minimo(arbol.hder)
            else:
                y = arbol.padre
                while y != None and arbol == y.hder:
                    arbol = y
                    y = y.padre

                if y == None:
                    return None
                else:
                    return y.valor
        elif arbol.valor <= valor and arbol.hder != None:
            return self.sucesor(valor,arbol.hder)
        elif arbol.valor > valor and arbol.hizq != None:
            return self.sucesor(valor,arbol.hizq)
        else:
            return None

    def insertar(self,valor, arbol = None):
        if arbol == None:
            arbol = self            
        if arbol.valor <= valor:
            if arbol.hder == None:
                nodo = ABB(valor,None,None,None)
                nodo.padre = arbol
                arbol.hder = nodo
            else:
                self.insertar(valor,arbol.hder)
        else:
            if arbol.hizq == None:
                nodo = ABB(valor,None,None,None)
                nodo.padre = arbol
                arbol.hizq = nodo
            else:
                 self.insertar(valor,arbol.hizq)

    def eliminar(self,valor,arbol=None):
        if arbol == None:
            arbol = self
        #Busco el nodo a elminar
        if arbol.valor == valor:            
            #Caso 1
            if arbol.hizq == None and arbol.hder == None:
                if arbol.padre.hizq == arbol:
                    arbol.padre.hizq = None
                else:
                    arbol.padre.hder = None

            #Caso 2
            elif arbol.hizq == None and arbol.hder != None:
                hijo = arbol.hder                
                if arbol.padre.hizq == arbol:
                    arbol.padre.hizq = hijo
                else:
                    arbol.padre.hder = hijo                  
            elif arbol.hizq != None and arbol.hder == None:
                hijo = arbol.hizq                
                if arbol.padre.hizq == arbol:
                    arbol.padre.hizq = hijo
                else:
                    arbol.padre.hder = hijo 
            else: #Caso
                suc = arbol.sucesor(arbol.valor)
                arbol.eliminar(suc)
                arbol.valor = suc
                

        elif arbol.valor <= valor and arbol.hder != None:
            return self.eliminar(valor,arbol.hder)
        elif arbol.valor > valor and arbol.hizq != None:
            return self.eliminar(valor,arbol.hizq)
        else:
            return None
        

    def to_string(self,arbol = None):
        if arbol == None:
            arbol = self
        
        valor = arbol.valor
        rama_izq,rama_der = "None","None"
        if arbol.hizq != None:
            rama_izq = arbol.hizq.to_string()
        if arbol.hder != None:
            rama_der = arbol.hder.to_string()
        
        return f"( {valor} {rama_izq}  {rama_der})"