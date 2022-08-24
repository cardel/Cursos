"""
Carlos Andres Delgado
12 de Mayo de 2022
Juego del gato y del ratón
"""
import numpy as np
from Nodo import Nodo

juego = np.array([
    [0,0,0,0,0,0,5],
    [0,1,2,0,2,0,2],
    [0,0,2,3,2,0,2],
    [0,0,2,0,2,0,2],
    [0,3,2,0,2,0,2],
    [0,0,2,0,2,0,2],
    [0,0,2,0,4,0,2]
])

def busqueda_amplitud(juego):
    for i in range(0,juego.shape[0]):
        for j in range(0,juego.shape[1]):
            if juego[i,j] == 1:
                pos_raton = (i,j)
                juego[i,j] = 0 #Colocar la posición como un espacio libre
                break #Salga del for

    raiz = Nodo(
        juego, 
        pos_raton, 
        (False,False),
        [pos_raton],
        [pos_raton]
    )
    cola = [raiz]
    nodos_expandidos = 1
    nodos_creados = 1
    while True:
        
        nodo = cola.pop(0) #quito el primero elemento
        nodos_expandidos += 1
        #Condicion de ganar
        if nodo.verificar_ganar():
            return nodo.recorrido,nodos_expandidos,nodos_creados


        hijos = nodo.generar_hijos()
        for h in hijos:
            if not(h.verificar_perdi()): #Solo evaluo nodos en cuales no pierdo
                cola.append(h)
            nodos_creados+=1
        #Condición de no encontrar
        if len(cola)==0:
            return None,nodos_expandidos,nodos_creados

def busqueda_profundidad(juego):
    for i in range(0,juego.shape[0]):
        for j in range(0,juego.shape[1]):
            if juego[i,j] == 1:
                pos_raton = (i,j)
                juego[i,j] = 0 #Colocar la posición como un espacio libre
                break #Salga del for

    raiz = Nodo(
        juego, 
        pos_raton, 
        (False,False),
        [pos_raton],
        [pos_raton]
    )
    pila = [raiz]
    nodos_expandidos = 1
    nodos_creados = 1
    while True:
        
        nodo = pila.pop(-1) #quito el primero elemento
        nodos_expandidos += 1
        #Condicion de ganar
        if nodo.verificar_ganar():
            return nodo.recorrido,nodos_expandidos,nodos_creados


        hijos = nodo.generar_hijos()
        for h in hijos:
            if not(h.verificar_perdi()): #Solo evaluo nodos en cuales no pierdo
                pila.append(h)
            nodos_creados+=1
        #Condición de no encontrar
        if len(pila)==0:
            return None,nodos_expandidos,nodos_creados


print(busqueda_amplitud(juego.copy()))
print(busqueda_profundidad(juego.copy()))