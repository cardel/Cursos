function bucketSort(arreglo){
	const n = arreglo.length;
	b = [];
	res =[];
	
	for(i=0; i<=n;i++){
		b.push([])
	}
	
	for(i=0; i<n; i++){
		pos = Math.ceil(n*arreglo[i]);
		b[pos].push(arreglo[i]);
	}
	
	for(i=0; i<=n;i++){
		elm = b[i];
		elm.sort();
		res = res.concat(elm);
	}
	return res;
}
ordenado = bucketSort([0.1,0.3,0.4,0.23,0.39,0.28,0.75,0.92,0.89]);
console.log(ordenado);

