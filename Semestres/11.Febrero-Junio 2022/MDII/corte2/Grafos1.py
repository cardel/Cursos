import networkx as nx
import matplotlib.pyplot as plt

grafo = nx.Graph()
grafo = grafo.to_undirected()

grafo.add_nodes_from([1,2,3,4,5,6])
grafo.add_edges_from([(1,2),(1,3),(2,4),(6,1),(5,1)])


nx.draw(grafo,pos=nx.spring_layout(grafo),with_labels=True)
plt.legend()
#plt.show()
print(nx.adjacency_matrix(grafo).todense())
print(nx.incidence_matrix(grafo).todense())