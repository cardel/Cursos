function partition(arreglo,p,r){
	
	const x = arreglo[p];
	i = p;
	j = r;
	
	while(i<j){
		if(arreglo[i]>=x){
			const aux = arreglo[i];
			arreglo[i]=arreglo[j];
			arreglo[j]=aux;
		}
		
		while(i<=r && arreglo[i]<x){
			i++;
		}
		
		while(j>=p && arreglo[j]>=x){
			j--;
		}
		
	}
	return j;
}


function quickSort(arreglo,p,r){
	if(p<r){
	
		const q = partition(arreglo,p,r);
		quickSort(arreglo,p,q);
		quickSort(arreglo,q+1,r);
	}
	
}


lista = [1,5,2,4,19,9,22,15,18]
quickSort(lista,0,lista.length-1)
console.log(lista)
