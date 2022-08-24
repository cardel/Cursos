"""
Carlos A Delgado
14 de Mayo de 2022
"""
import numpy as np
from Nodo import Nodo

juego = np.array([
    [0, 1, 0, 0, 0, 7],
    [3, 0, 3, 0, 4, 0],
    [3, 6, 0, 0, 0, 3],
    [5, 0, 0, 4, 0, 0],
    [3, 3, 3, 0, 2, 0],
    [3, 3, 4, 4, 0, 0],
])

def bfs(matriz_juego):
    nodo_creados = 0
    nodos_expandidos = 0

    for i in range(matriz_juego.shape[0]):
        for j in range(matriz_juego.shape[1]):
            if matriz_juego[i][j]==1:
                pos_agente = (j,i) #x,y
                matriz_juego[i][j] = 0
                break

    raiz = Nodo(
        matriz_juego,
        pos_agente,
        [False,False],
        [pos_agente], #Recorrido
        [pos_agente]  #Visitado
    )

    cola = [raiz]

    while len(cola) > 0: #Condicion de parada
        nodo = cola.pop(0)
        nodos_expandidos+=1
        if(nodo.condicionGanar()):
            return nodo.recorrido,nodo_creados,nodos_expandidos #Retorno la solución

        x = nodo.posAgente[0]
        y = nodo.posAgente[1]

        #Genero los hijos
        
        #Arriba
        xI = x
        yI = y - 1

        if yI>=0 and not( (xI,yI) in nodo.nodos_visitados) and nodo.matriz[y,x]!=3:
            nodos_visitados = nodo.nodos_visitados.copy() #Pasar por valor
            nodos_visitados.append((xI,yI))
            recorrido = nodo.recorrido.copy() #Evitar pasa por referencia
            recorrido.append((xI,yI))
            estado = nodo.estado.copy()

            hijo = Nodo(
                nodo.matriz, #Compartido
                (xI,yI), #Nueva posición
                estado,
                recorrido, #Nuevo
                nodos_visitados #Nuevo
            )
            nodo_creados+=1
            hijo.marcar() #Evaluar que sucede en la posición
            if not(hijo.validar_perder()):
                cola.append(hijo)

        #Abajo
        xI = x
        yI = y + 1

        if yI<matriz_juego.shape[0] and not((xI,yI) in nodo.nodos_visitados) and nodo.matriz[y,x]!=3:
            nodos_visitados = nodo.nodos_visitados.copy() #Pasar por valor
            nodos_visitados.append((xI,yI))
            recorrido = nodo.recorrido.copy() #Evitar pasa por referencia
            recorrido.append((xI,yI))
            estado = nodo.estado.copy()

            hijo = Nodo(
                nodo.matriz, #Compartido
                (xI,yI), #Nueva posición
                estado,
                recorrido, #Nuevo
                nodos_visitados #Nuevo
            )
            nodo_creados+=1
            hijo.marcar() #Evaluar que sucede en la posición
            if not(hijo.validar_perder()):
                cola.append(hijo)

        
        #Izquierda
        xI = x-1
        yI = y

        if xI>=0 and not( (xI,yI) in nodo.nodos_visitados) and nodo.matriz[y,x]!=3:
            nodos_visitados = nodo.nodos_visitados.copy() #Pasar por valor
            nodos_visitados.append((xI,yI))
            recorrido = nodo.recorrido.copy() #Evitar pasa por referencia
            recorrido.append((xI,yI))
            estado = nodo.estado.copy()

            hijo = Nodo(
                nodo.matriz, #Compartido
                (xI,yI), #Nueva posición
                estado,
                recorrido, #Nuevo
                nodos_visitados #Nuevo
            )
            nodo_creados+=1
            hijo.marcar() #Evaluar que sucede en la posición
            if not(hijo.validar_perder()):
                cola.append(hijo)


        #Derecha
        xI = x+1
        yI = y

        if xI<matriz_juego.shape[1] and not((xI,yI) in nodo.nodos_visitados) and nodo.matriz[y,x]!=3:
            nodos_visitados = nodo.nodos_visitados.copy() #Pasar por valor
            nodos_visitados.append((xI,yI))
            recorrido = nodo.recorrido.copy() #Evitar pasa por referencia
            recorrido.append((xI,yI))
            estado = nodo.estado.copy()

            hijo = Nodo(
                nodo.matriz, #Compartido
                (xI,yI), #Nueva posición
                estado,
                recorrido, #Nuevo
                nodos_visitados #Nuevo
            )
            nodo_creados+=1
            hijo.marcar() #Evaluar que sucede en la posición
            if not(hijo.validar_perder()):
                cola.append(hijo)
    return "no hay solución",nodo_creados,nodos_expandidos


def dfs(matriz_juego):
    nodo_creados = 0
    nodos_expandidos = 0

    for i in range(matriz_juego.shape[0]):
        for j in range(matriz_juego.shape[1]):
            if matriz_juego[i][j]==1:
                pos_agente = (j,i) #x,y
                matriz_juego[i][j] = 0
                break

    raiz = Nodo(
        matriz_juego,
        pos_agente,
        [False,False],
        [pos_agente], #Recorrido
        [pos_agente]  #Visitado
    )

    pila = [raiz]

    while len(pila) > 0: #Condicion de parada
        nodo = pila.pop(-1)
        nodos_expandidos+=1
        if(nodo.condicionGanar()):
            return nodo.recorrido,nodo_creados,nodos_expandidos #Retorno la solución

        x = nodo.posAgente[0]
        y = nodo.posAgente[1]

        #Genero los hijos
        
        #Arriba
        xI = x
        yI = y - 1

        if yI>=0 and not( (xI,yI) in nodo.nodos_visitados) and nodo.matriz[y,x]!=3:
            nodos_visitados = nodo.nodos_visitados.copy() #Pasar por valor
            nodos_visitados.append((xI,yI))
            recorrido = nodo.recorrido.copy() #Evitar pasa por referencia
            recorrido.append((xI,yI))
            estado = nodo.estado.copy()

            hijo = Nodo(
                nodo.matriz, #Compartido
                (xI,yI), #Nueva posición
                estado,
                recorrido, #Nuevo
                nodos_visitados #Nuevo
            )
            nodo_creados+=1
            hijo.marcar() #Evaluar que sucede en la posición
            if not(hijo.validar_perder()):
                pila.append(hijo)

        #Abajo
        xI = x
        yI = y + 1

        if yI<matriz_juego.shape[0] and not((xI,yI) in nodo.nodos_visitados) and nodo.matriz[y,x]!=3:
            nodos_visitados = nodo.nodos_visitados.copy() #Pasar por valor
            nodos_visitados.append((xI,yI))
            recorrido = nodo.recorrido.copy() #Evitar pasa por referencia
            recorrido.append((xI,yI))
            estado = nodo.estado.copy()

            hijo = Nodo(
                nodo.matriz, #Compartido
                (xI,yI), #Nueva posición
                estado,
                recorrido, #Nuevo
                nodos_visitados #Nuevo
            )
            nodo_creados+=1
            hijo.marcar() #Evaluar que sucede en la posición
            if not(hijo.validar_perder()):
                pila.append(hijo)

        
        #Izquierda
        xI = x-1
        yI = y

        if xI>=0 and not( (xI,yI) in nodo.nodos_visitados) and nodo.matriz[y,x]!=3:
            nodos_visitados = nodo.nodos_visitados.copy() #Pasar por valor
            nodos_visitados.append((xI,yI))
            recorrido = nodo.recorrido.copy() #Evitar pasa por referencia
            recorrido.append((xI,yI))
            estado = nodo.estado.copy()

            hijo = Nodo(
                nodo.matriz, #Compartido
                (xI,yI), #Nueva posición
                estado,
                recorrido, #Nuevo
                nodos_visitados #Nuevo
            )
            nodo_creados+=1
            hijo.marcar() #Evaluar que sucede en la posición
            if not(hijo.validar_perder()):
                pila.append(hijo)


        #Derecha
        xI = x+1
        yI = y

        if xI<matriz_juego.shape[1] and not((xI,yI) in nodo.nodos_visitados) and nodo.matriz[y,x]!=3:
            nodos_visitados = nodo.nodos_visitados.copy() #Pasar por valor
            nodos_visitados.append((xI,yI))
            recorrido = nodo.recorrido.copy() #Evitar pasa por referencia
            recorrido.append((xI,yI))
            estado = nodo.estado.copy()

            hijo = Nodo(
                nodo.matriz, #Compartido
                (xI,yI), #Nueva posición
                estado,
                recorrido, #Nuevo
                nodos_visitados #Nuevo
            )
            nodo_creados+=1
            hijo.marcar() #Evaluar que sucede en la posición
            if not(hijo.validar_perder()):
                pila.append(hijo)
    return "no hay solución",nodo_creados,nodos_expandidos


print(bfs(juego.copy()))
print(dfs(juego.copy()))
