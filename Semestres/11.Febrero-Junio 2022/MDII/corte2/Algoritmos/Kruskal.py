"""
Carlos A Delgado
14 de Mayo de 2022
Algoritmo de prim sobre matriz de grafo
"""
import numpy as np
import networkx as nx
import matplotlib.pyplot as plt
grafo = np.array(
    [
        [0,5,0,0,0,0],
        [0,0,6,1,0,7],
        [0,0,0,0,0,4],
        [2,0,0,0,4,0],
        [0,0,0,0,0,0],
        [0,0,0,3,0,6]
    ]
)
nodos =["A","B","C","D","E","F"]

def kruskal(MR,etiquetas):
    """
    Este algoritmo recibe MR que es la matriz de adyancencia
    Lista que contiene las aritas del árbol recubridor minimo
    etiquetas: nodos del arbol
    """
    lista_aristas = []
    mini = float("inf")
    (posi,posj) = 0,0
    nodos_arbol = set()
    for i in range(MR.shape[0]):
        for j in range(MR.shape[1]):
            if MR[i][j]<mini and MR[i][j]!=0:
                mini = MR[i][j]
                (posi,posj) = i,j
    
    nodos_arbol.update({etiquetas[posi],etiquetas[posj]}) #Agrego los nodos que están en el arbol
    lista_aristas.append((etiquetas[posi],etiquetas[posj])) #Agrego en mi lista de salida

    #Algoritmo: Recorro las n-2 aristas restantes
    
    for k in range(MR.shape[0]-2):
        peso_actual = float("inf")
        for i in range(MR.shape[0]):
            for j in range(MR.shape[1]):
                #Escojer la menor arista incidente al arbol
                #Sin que sea ciclo
                u = etiquetas[i]
                v = etiquetas[j]
                peso = MR[i][j]
                if (u in nodos_arbol or v in nodos_arbol) and not(u in nodos_arbol and v in nodos_arbol) and MR[i][j]>0:
                    if peso < peso_actual and not((u,v) in lista_aristas):
                        posi,posj = i,j
                        peso_actual = peso
        #Agrego la arista a la lista
        nodos_arbol.update({etiquetas[posi],etiquetas[posj]}) #Agrego los nodos que están en el arbol
        lista_aristas.append((etiquetas[posi],etiquetas[posj])) #Agrego en mi lista de salida
        

    return lista_aristas

lista_aristas = kruskal(grafo,nodos)

Grafo = nx.Graph()
Grafo = Grafo.to_directed()
Grafo.add_nodes_from(nodos)
Grafo.add_edges_from(lista_aristas)
nx.draw(Grafo,with_labels=True)
plt.show()

