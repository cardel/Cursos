"""
Autor: Carlos A Delgado
Fecha: 21 de Abril de 2022
Descripción juego de triqui inteligente
"""
import numpy as np
class triqui:
    def __init__(self,n):
        self.board = np.zeros((n,n))
        self.n = n
    def winner(self,player):
        """
        player: 1 es P1 si es 2 es Maquina
        """
        matrixVerify = self.board == player
        n = self.n
        #Verifico filas
        ganar = True
        for i in range(0,n):
            ganar = True
            for j in range(0,n):
                ganar = ganar and matrixVerify[i][j]

            if ganar:
                return True

        #Verifico columnas
        ganar = True
        for j in range(0,n):
            ganar = True
            for i in range(0,n):
                ganar = ganar and matrixVerify[i][j]
            if ganar:
                return True


        #Verifico diagonal de iz a Derecha
        ganar = True
        for k in range(0,n):
            ganar = ganar and matrixVerify[k][k]
        
        if ganar:
            return True

        ganar = True
        for k in range(0,n):
            ganar = ganar and matrixVerify[k][n-1-k]

        if ganar:
            return True

        return False

    def play(self,player,posx,posy):
        if self.board[posx][posy]==0:
            self.board[posx][posy] = player
        else:
            print("Esta posición ya está jugada")
            print("Ingrese la jugada del jugador ",player)
            posx = int(input("Ingrese x "))
            posy = int(input("Ingrese y "))
            self.play(player,posx,posy)