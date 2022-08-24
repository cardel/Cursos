"""
Carlos A Delgado S
Algoritmo de Dijsktra para grafo ponderado
"""
import networkx as nx  

def dijktra(G,xi,xf):
    L = {} #Distancias diccionario
    R = {} #Recorrido diccionario
    S = set() #Nodos visitados

    for nodo in G.nodes():
        L[nodo] = float("inf")
        R[nodo] = "None"

    L[xi] = 0

    while not(xf in S):
        min = float("inf")
        for nodo,weigth in L.items():
            if weigth < min and not(nodo in S):
                u = nodo
                min = weigth
        
        S.update([u])

        for v in G.nodes():
            if not(v in S) and G.has_edge(u,v):
                distance = L[u] + G[u][v]["weight"]
                if  distance < L[v]:
                    L[v] = distance
                    R[v] = u
    
    return L,R

grafo = nx.Graph()
grafo.add_nodes_from(["Bogota","Lima","Quito","La Paz","Asuncion","Buenos Aires"])
grafo.add_weighted_edges_from([
    ("Bogota","Lima",4),
    ("Bogota","Quito",2),
    ("Quito","Lima",1),
    ("Lima","La Paz",5),
    ("Lima","Asuncion",7),
    ("Quito","La Paz",8),
    ("Quito","Asuncion",10),
    ("La Paz","Asuncion",2),
    ("La Paz","Buenos Aires",6),
    ("Asuncion","Buenos Aires",3)
])
L,R = dijktra(grafo,"Bogota","Buenos Aires")
print(L)
print(R)