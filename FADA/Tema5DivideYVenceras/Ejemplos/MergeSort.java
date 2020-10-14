import java.util.Arrays;



public class MergeSort{
	
	
	static void combinar(int A[], int p, int q, int r){
		
		//Mi primer arreglo va desde p hasta q esta ordenado
		//Mi segundo arreglo va desde q +1 hasta r ordenado
		
		int primerArreglo[] = new int[(q-p+1)];
		int segundoArreglo[] = new int[(r-(q+1)+1)];
		
		int count = 0;
		for(int i = p; i<=q; i++){
			primerArreglo[count] = A[i];
			count++;
		}
		
		count = 0;
		
		for(int i= q+1; i<=r; i++){
			segundoArreglo[count] = A[i];
			count++;
		}
		
		//ordenar
		
		int indexPrimerArreglo = 0;
		int indexSegundoArreglo = 0;
		
		for(int i=p; i<=r; i++){
			
			if(indexPrimerArreglo == primerArreglo.length){
				A[i] = segundoArreglo[indexSegundoArreglo];
				indexSegundoArreglo++;
			}
			else{
				if(indexSegundoArreglo == segundoArreglo.length){
					A[i] = primerArreglo[indexPrimerArreglo];
					indexPrimerArreglo++;
				}
				else{
					if(primerArreglo[indexPrimerArreglo] > segundoArreglo[indexSegundoArreglo]){
				
						A[i] = segundoArreglo[indexSegundoArreglo];
						indexSegundoArreglo++;
					}else{
						A[i] = primerArreglo[indexPrimerArreglo];
						indexPrimerArreglo++;
				}

				}
				
			}
			
		}
		
	}
	
	static void MergeS(int A[], int p, int r){
		//System.out.println("p "+p+" r "+r);
		if (p < r){
			int q = (p+r)/2;
			MergeS(A, p, q);
			MergeS(A,q+1,r);
			combinar(A,p,q,r);
		}
	}
	
	public static void main(String args[]){
		int[] arreglo = {2,3,9,16,11,22,1,8,0};
		System.out.println(Arrays.toString(arreglo));

		MergeS(arreglo,0,arreglo.length-1);
		
		System.out.println(Arrays.toString(arreglo));
	}
}
