
import InsertionSort
import mergeSort
import numpy as np
import time

for size in [10,50,100,500]:
    for i in range(0,4):
        listaA = np.random.randint(1,5000,size).tolist()
        listaB = np.random.randint(1,5000,size).tolist()

        """
        Tiempos
        """
        inicioInsertion = time.time()*1000
        InsertionSort.insertionSort(listaA)
        finalInsertion = time.time()*1000
        #print(f"Insertion n {size} tiempo {finalInsertion-inicioInsertion}")

        inicioMerge = time.time()*1000
        mergeSort.mergeSort(listaB,0,len(listaB)-1)
        finalMerge = time.time()*1000
        print(f"Merge n {size} tiempo {finalMerge-inicioMerge}")
