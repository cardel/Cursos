def insertion_sort(arreglo):
	arreglo_ord = arreglo.copy()

	for i in range(1,len(arreglo_ord)):
		j = i
		while j>=1 and arreglo_ord[j]<arreglo_ord[j-1]:
			arreglo_ord[j],arreglo_ord[j-1] = arreglo_ord[j-1], arreglo_ord[j]

			j-=1

	return arreglo_ord


