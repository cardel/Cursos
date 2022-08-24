import insertionsort, selectionSort, mergeSort, quickSort
import time
import numpy as np
import matplotlib.pyplot as plt

"""
insertionsort.insertion_sort(arr)

selectionSort.selection_sort(arr)

mergeSort.mergeSort(arr,0,len(arr)-1)

quickSort.quickSort(arr,0,len(arr)-1)
"""
insertion = []
selection = []
mergesort = []
quicksort = []
tam = [10,100,500,1000,2000,5000,10000]

for i in tam:
	print(f"Arreglos tamaño {i}")
	arregloA = np.random.randint(0,10*i,i).tolist()
	arregloB = np.random.randint(0,10*i,i).tolist()
	arregloC = np.random.randint(0,10*i,i).tolist()
	arregloD = np.random.randint(0,10*i,i).tolist()

	inicio = time.time()
	insertionsort.insertion_sort(arregloA)
	final = time.time()
	insertion.append(final-inicio)

	inicio = time.time()
	selectionSort.selection_sort(arregloB)
	final = time.time()
	selection.append(final-inicio)


	inicio = time.time()
	mergeSort.mergeSort(arregloC,0,len(arregloC)-1)
	final = time.time()
	mergesort.append(final-inicio)


	inicio = time.time()
	quickSort.quickSort(arregloD,0,len(arregloD)-1)
	final = time.time()
	quicksort.append(final-inicio)
	

plt.figure(dpi=300)

plt.plot(tam,insertion,label="Insertion sort")
plt.plot(tam,selection,label="Selection sort")
plt.plot(tam,mergesort,label="Merge sort")
plt.plot(tam,quicksort,label="Quick sort")
plt.grid()
plt.legend()
plt.xlabel("Tamaño")
plt.ylabel("Complejidad (s)")
plt.show()
plt.savefig("datos.png")


plt.figure(dpi=300)

plt.plot(tam,mergesort,label="Merge sort")
plt.plot(tam,quicksort,label="Quick sort")
plt.grid()
plt.legend()
plt.xlabel("Tamaño")
plt.ylabel("Complejidad (s)")
plt.show()
plt.savefig("datosB.png")

