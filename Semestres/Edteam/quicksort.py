import sys
sys.setrecursionlimit(2000)
def partition(arreglo,p,r):
	x = arreglo[p]
	i = p
	j = r
	
	while i<j:
		if arreglo[i]>=x:
			arreglo[i],arreglo[j]=arreglo[j],arreglo[i]
		
		while i<=r and arreglo[i]<x:
			i+=1 #Este busca uno que sea mayor o igual que x
		
		while j>=p and arreglo[j]>=x:
			j-=1 #Este busca uno que sea menor que.
	
	return j


def quickSort(arreglo,p,r):
	if p<r:
		q = partition(arreglo,p,r)
		quickSort(arreglo,p,q)
		quickSort(arreglo,q+1,r)


lista = [1,5,2,4,19,9,22,15,18]
quickSort(lista,0,len(lista)-1)
print(lista)
