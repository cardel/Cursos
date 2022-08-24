def selection_sort(arreglo):
    arreglo_ordenado = arreglo.copy()

    for i in range(0,len(arreglo_ordenado)):
        minimum = arreglo_ordenado[i]
        pos_min = i
        for j in range(i+1,len(arreglo_ordenado)):
            if arreglo_ordenado[j]<minimum:
                minimum = arreglo_ordenado[j]
                pos_min = j
        if pos_min != i:
            arreglo_ordenado[i],arreglo_ordenado[pos_min] =arreglo_ordenado[pos_min],arreglo_ordenado[i]
                
    return arreglo_ordenado


