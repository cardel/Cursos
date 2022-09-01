"""
Carlos A Delgado S
01 de Septiembre de 2022
Ejemplo de insertion sort
"""
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


def worst_case(n):
  return 1.5*n**2+3.5*n-4

def best_case(n):
  return 5*n-4

def average_case(n):
  return 0.75*n**2+2.75*n-3.5

lA = [2,3,34,23,23,23,2,3]
insertion_sort(lA)

print(worst_case(10),insertion_sort([10,9,8,7,6,5,4,3,2,1]))
print(best_case(10),insertion_sort([1,2,3,4,5,6,7,8,9,10]))

n_experiments = 100000
average = average_case(10)
experimental_average = 0
for i in range(0,n_experiments):
  listaP = np.random.randint(0,50,10)
  experimental_average+=insertion_sort(listaP)


print(average,experimental_average/n_experiments)
