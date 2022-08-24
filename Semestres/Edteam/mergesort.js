function merge(arreglo,p,q,r){
	
	left = arreglo.slice(p,q+1);
	right = arreglo.slice(q+1,r+1);
	
	left.push(Infinity);
	right.push(Infinity);
	
	i = 0;
	j = 0;
	
	for(k=p;k<=r;k++){
		if(left[i]<right[j]){
			arreglo[k]=left[i];
			i++;
		}
		else{
			arreglo[k]=right[j];
			j++;
		}
	}
	
}


function mergeSort(arreglo,p,r){
	if(p<r){
		const q = Math.floor((p+r)/2);
		mergeSort(arreglo,p,q);
		mergeSort(arreglo,q+1,r);
		merge(arreglo,p,q,r);
	}
}
lista = [1,5,2,4,19,9,22,15,18];
mergeSort(lista,0,lista.length-1);
console.log(lista);
