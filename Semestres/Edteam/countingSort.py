def countingSort(arreglo):
	b = [0]*(len(arreglo)+1)
	k = max(arreglo)
	c = [0]*(k+1)
	b[0]=float("nan")
	
	for i in range(0,len(arreglo)):
		c[arreglo[i]]+=1
		
	for i in range(1,len(c)):
		c[i]+=c[i-1]
		
	for i in range(0,len(arreglo)):
		b[c[arreglo[i]]] = arreglo[i]
		c[arreglo[i]]-=1
		
	return b
	

lista = [1,5,1,1,7,9,12,4,12]
lista_ordenada = countingSort(lista)
print(lista_ordenada)
	
	
