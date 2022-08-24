function countingSort(arreglo){
	b = new Array(arreglo.length+1).fill(0);
	const k = Math.max(...arreglo);
	c = new Array(k+1).fill(0)
	
	for(i=0;i<arreglo.length;i++){
		c[arreglo[i]]+=1;
	}
	
	for(i=1;i<c.length;i++){
		c[i]=c[i]+c[i-1];
	}
	for(i=0;i<arreglo.length;i++){
		b[c[arreglo[i]]]=arreglo[i];
		c[arreglo[i]]-=1;
	}
	return b;
}

lista = [1,5,1,1,7,9,12,4,12]
lista_ordenada = countingSort(lista)
console.log(lista_ordenada)
	
