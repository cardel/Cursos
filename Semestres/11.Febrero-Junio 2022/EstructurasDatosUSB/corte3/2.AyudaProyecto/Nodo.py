class Nodo:
    def __init__(self,matriz,pos_raton,estado,recorrido,marcados):
        """
        matriz = Estado actual del juego
        pos_raton = posición actual del ratón x,y (enteros)
        estado = estado de los objetivos queso,pelota (booleanos)
        """
        self.matriz = matriz
        self.x = pos_raton[0]
        self.y = pos_raton[1]
        self.queso = estado[0]
        self.pelota = estado[1]
        self.recorrido = recorrido
        self.marcados = marcados


    def verificar_perdi(self):
        return self.matriz[self.y,self.x] == 3

    def verificar_ganar(self):
        return self.pelota and self.queso #Verificar que encontré los dos objetivos

    def marcar_objetivos(self):
        if  not(self.queso) and self.matriz[self.y,self.x]==4:
            self.queso = True
            self.marcados = [] #Al encontrar el queso, puedo devolverme
        
        if self.matriz[self.y,self.x]==5 and self.queso:
            self.pelota = True


    def generar_hijos(self):
        #Hijo de arriba
        hijos = []
        x = self.x
        y = self.y-1
        
        if y >= 0 and not((x,y) in self.marcados) and self.matriz[y,x]!=2: #Verificar que estoy en el tablero
            recorrido = self.recorrido.copy() #Garantizar que sea independiente
            recorrido.append((x,y)) #Agregar la posición actual
            marcados = self.marcados.copy() #Nodos ya visitados
            marcados.append((x,y)) 
            hijo = Nodo(
                self.matriz,
                (x,y),
                (self.queso,self.pelota),
                recorrido,   
                marcados   
            )
            hijo.marcar_objetivos()
            hijos.append(hijo)            
        #Hijo de abajo

        x = self.x
        y = self.y+1
        
        if y < self.matriz.shape[0]  and not((x,y) in self.marcados) and self.matriz[y,x]!=2: #Verificar que estoy en el tablero
            recorrido = self.recorrido.copy() #Garantizar que sea independiente
            recorrido.append((x,y)) #Agregar la posición actual
            marcados = self.marcados.copy() #Nodos ya visitados
            marcados.append((x,y)) 
            hijo = Nodo(
                self.matriz,
                (x,y),
                (self.queso,self.pelota),
                recorrido,   
                marcados    
            )
            hijo.marcar_objetivos()
            hijos.append(hijo)



        #Hijo de la izquierda

        x = self.x-1
        y = self.y
        
        if x >= 0 and not((x,y) in self.marcados) and self.matriz[y,x]!=2: #Verificar que estoy en el tablero
            recorrido = self.recorrido.copy() #Garantizar que sea independiente
            recorrido.append((x,y)) #Agregar la posición actual
            marcados = self.marcados.copy() #Nodos ya visitados
            marcados.append((x,y)) 
            hijo = Nodo(
                self.matriz,
                (x,y),
                (self.queso,self.pelota),
                recorrido,       
                marcados
            )
            hijo.marcar_objetivos()
            hijos.append(hijo)
       #Derecha
        x = self.x+1
        y = self.y
        
        if x < self.matriz.shape[1] and not((x,y) in self.marcados) and self.matriz[y,x]!=2: #Verificar que estoy en el tablero
            recorrido = self.recorrido.copy() #Garantizar que sea independiente
            recorrido.append((x,y)) #Agregar la posición actual
            marcados = self.marcados.copy() #Nodos ya visitados
            marcados.append((x,y)) 
            hijo = Nodo(
                self.matriz,
                (x,y),
                (self.queso,self.pelota),
                recorrido,
                marcados

            )
            hijo.marcar_objetivos()
            hijos.append(hijo)
 
        return hijos