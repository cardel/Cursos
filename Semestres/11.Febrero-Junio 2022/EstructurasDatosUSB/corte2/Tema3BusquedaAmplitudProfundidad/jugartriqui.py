from triqui import triqui
from bfs import bfs
print("Ingrese el tamaño del tablero")
n = int(input())

objTriqui = triqui(n)

while True:
    print(objTriqui.board)
    print("Ingrese la jugada del P1")
    posx = int(input("Ingrese x "))
    posy = int(input("Ingrese y "))

    objTriqui.play(1, posx, posy)

    if objTriqui.winner(1):
        print(objTriqui.board)
        print("Ganó el jugador 1")
        break

    """print(objTriqui.board)
    print("Ingrese la jugada del P2")
    posx = int(input("Ingrese x "))
    posy = int(input("Ingrese y "))

    objTriqui.play(2, posx, posy)"""
    posx,posy=bfs(objTriqui.board)
    objTriqui.play(2, posx, posy)

    if posx==-1 and posy==-1:
        print(objTriqui.board)
        print("Ganó el jugador 1")
        break


    if objTriqui.winner(2):
        print(objTriqui.board)
        print("Ganó el jugador 2")
        break
