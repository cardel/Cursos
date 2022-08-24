
class Nodo:
    def __init__(self,matriz,posAgente,estado,recorrido,nodos_visitados):
        self.matriz = matriz
        self.posAgente = posAgente
        self.estado = estado
        self.recorrido = recorrido
        self.nodos_visitados = nodos_visitados #Evitar devolverse

    def condicionGanar(self):
        return self.estado[0] and self.estado[1]

    def marcar(self):
        #print(self.posAgente)
        if self.matriz[self.posAgente[1],self.posAgente[0]]==2 and not(self.estado[0]):
            self.estado[0] = True #Encontramos a Aida
            self.nodos_visitados = [] #para que pueda devolverse

        if self.estado[0] and self.matriz[self.posAgente[1],self.posAgente[0]]==7:
            self.estado[1] = True #Encontramos el avión


    def validar_perder(self):
        x,y = self.posAgente[1],self.posAgente[0]
        return self.matriz[x,y]==4 or self.matriz[x,y]==5 or self.matriz[x,y]==6