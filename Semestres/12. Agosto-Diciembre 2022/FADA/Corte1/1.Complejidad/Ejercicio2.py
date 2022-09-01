"""
Carlos A Delgado S
01 de Septiembre de 2022
"""

import matplotlib.pyplot as plt
import numpy as np

def insertion_sort(lista):
  cnt = 1 #Valor de salida
  for j in range(1,len(lista)):
    cnt+=1 #Entrada del foro
    key = lista[j]
    cnt+=1 #Anterior linea
    i = j - 1
    cnt+=1 #Anterior linea
    cnt+=1 #Valor de salida del while interno
    while i>=0 and lista[i] > key:
      cnt+=1 #Entrada del while
      lista[i+1] = lista[i]
      cnt+=1 #Anterior linea
      i = i - 1
      cnt+=1 #Anterior linea
    lista[i+1] = key
    cnt+=1 #Anterior linea
  
  return cnt

def ordenar_artesanal(A):
  cnt = 1  #Salida for externo
  for i in range(0,len(A)):
    cnt += 1 #Entrada for externo
    cnt += 1 #Salida del for interno
    for j in range(0,len(A)):
      cnt +=1 #Entrada del for interno
      cnt +=1 #Validación del if

      if A[i]<A[j]:
        A[i],A[j] = A[j],A[i]
        cnt+=1 #Operación

  return cnt


listaA = [22,23,23,2,3]
insertion_sort(listaA)

listaB = [12,32,3,23,23,2]
ordenar_artesanal(listaB)

print(listaA,listaB)


#EXperimentos
n_experimentos = 100
n_sizes = [10,20,50,100]

t_insertion = np.zeros(len(n_sizes))
t_artesanal = np.zeros(len(n_sizes))

for i in range(0,len(n_sizes)):
  n = n_sizes[i]
  for j in range(0,n_experimentos):
    listaA = np.random.randint(0,10000,n)
    listaB = np.random.randint(0,10000,n)
    cntInset = insertion_sort(listaA)
    cntArtes = ordenar_artesanal(listaB)
    t_insertion[i]+=cntInset/n_experimentos
    t_artesanal[i]+=cntArtes/n_experimentos

plt.figure(dpi=200)
plt.plot(n_sizes,t_insertion, label="Insertion sort")
plt.plot(n_sizes,t_artesanal,label="Artesanal")
plt.legend()
plt.show()
