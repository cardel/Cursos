function ordenar(arreglo){
  arreglo_ordenado = arreglo.slice();
  for(i=0;i<arreglo_ordenado.length-1;i++){
    j = i;
    while(arreglo_ordenado[j]>arreglo_ordenado[j+1] && j>=0){
      let aux = arreglo_ordenado[j];
			arreglo_ordenado[j] = arreglo_ordenado[j+1];
			arreglo_ordenado[j+1] = aux;
      j--;
    }
  }
  return arreglo_ordenado;
}

let arregloA = [29,10,14,37,18];
let arregloB = [3,44,38,5,47,15,36,26,27];

console.log(ordenar(arregloA));
console.log(ordenar(arregloB));
