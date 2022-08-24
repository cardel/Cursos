def merge(arreglo,p,q,r):
	left = arreglo[p:q+1]
	right = arreglo[q+1:r+1]
	
	left.append(float("inf"))
	right.append(float("inf"))
	i = 0
	j = 0
	
	for k in range(p,r+1):
		if left[i]<right[j]:
			arreglo[k]=left[i]
			i+=1
		else:
			arreglo[k]=right[j]
			j+=1
	


def mergeSort(arreglo,p,r):
	if p<r:
		q = (p+r)//2
		mergeSort(arreglo,p,q)
		mergeSort(arreglo,q+1,r)
		merge(arreglo,p,q,r)

