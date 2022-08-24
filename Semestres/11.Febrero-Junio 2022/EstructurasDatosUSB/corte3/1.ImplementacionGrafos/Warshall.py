import networkx as nx
import matplotlib.pyplot as plt
grafo = nx.Graph()
grafo = grafo.to_directed() #Transformar a dirigdo
grafo.add_nodes_from(["a","b","c","d","e"])

grafo.add_edges_from([
    ("a","b"),("a","e"),("b","b"),
    ("b","a"),("b","c"),("d","a"),
    ("d","e"),("e","b"),("e","c")
])



def warshall_algorithm(MR):
    W = MR.copy()
    n = MR.shape[0]
    for k in range(n): #Pivote
        Wk = W.copy() #Matriz actual, W matriz anterior
        for i in range(n): #Filas
            for j in range(n): #Columnas
                Wk[i,j] = W[i,j] or (W[k,j] and W[i,k])
        W = Wk.copy() #Actualizar la matriz
    return W

MR = nx.adjacency_matrix(grafo).todense()
print(warshall_algorithm(MR))
nx.draw(grafo, pos=nx.spring_layout(grafo), with_labels=True, node_size=1500,node_color="red",edge_color="green")
plt.show()