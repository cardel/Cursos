function selection_sort(arreglo){

	arreglo_ord = arreglo.slice();

	for(i=0; i<arreglo.length-1;i++){
		min = arreglo_ord[i];
		pos_min = i;
		for(j=i+1;j<arreglo_ord.length;j++){
			if(arreglo_ord[j]<min){
				min = arreglo_ord[j];
				pos_min = j;
			}
		}

		if(i!=pos_min){
			aux =arreglo_ord[i];
			arreglo_ord[i] = arreglo_ord[pos_min];
			arreglo_ord[pos_min] = aux

		}

	}

	return arreglo_ord;
}

console.log(selection_sort([10,2,3,-1,11,2,3,4,5,6,7,8,9,-2,4]))
