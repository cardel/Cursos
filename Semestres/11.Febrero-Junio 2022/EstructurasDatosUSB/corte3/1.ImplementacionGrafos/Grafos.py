import networkx as nx
import matplotlib.pyplot as plt
grafo = nx.Graph()

grafo.add_nodes_from(["a","b","c","d","e","f","g","h","i"])

grafo.add_edges_from([
    ("a","b"),
    ("a","c"),
    ("c","b"),
    ("e","f"),
    ("f","a"),
    ("h","i"),
    ("f","h"),
    ("g","a"),
    ("a","g"),
    ("g","i"),
    ("d","c")
])

print(nx.adjacency_matrix(grafo).todense())
print(nx.incidence_matrix(grafo).todense())

nx.draw(grafo, pos=nx.spring_layout(grafo), with_labels=True, node_size=1500,node_color="red",edge_color="green")
plt.show()