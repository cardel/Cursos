import numpy as np
"""
Carlos A Delgado
Busqueda por amplitud
21-04-2022
"""
def winner(board):
    """
    player: 1 es P1 si es 2 es Maquina
    """
    player = 2
    matrixVerify = board == player
    n = board.shape[0]
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

def dfs(board):
    """Obtener las posiciones libres"""
    cola = []
    lista = []
    actual_player = 2
    for i in range(0,board.shape[0]):
        for j in range(0,board.shape[1]):
            if board[i,j] == 0:
                lista.append((i,j))
 
    #Generamos la jugada
    for play in lista:
        tablero_jugada = board.copy()
        tablero_jugada[play[0]][play[1]] = actual_player
        cola.append([[play],tablero_jugada.copy()])

    while len(cola) > 0:
        actual_player = 1 if actual_player == 2 else 2
        elemento = cola.pop(-1)
        if winner(elemento[1]):
            print(elemento[0])
            return elemento[0][0]
        possible_plays = []
        for i in range(0,board.shape[0]):
            for j in range(0,board.shape[1]):
                if board[i,j] == 0:
                    possible_plays.append((i,j))

        for play in possible_plays:
            tablero_jugada = elemento[1].copy()
            tablero_jugada[play[0]][play[1]] = actual_player
            new_play = elemento[0].copy()
            new_play.append(play)
            cola.append([new_play,tablero_jugada.copy()])

    return -1,-1        
