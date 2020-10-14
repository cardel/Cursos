import java.util.Arrays;

public class BuscarMaximo{
	
	
	
	static void combinar(int A[], int p,int q, int r){
		
		if(A[p] < A[q+1]){
			int aux = A[p];
			A[p] = A[q+1];
			A[q+1] = aux;
		}
		
	}
	
	static void BuscarMaximo(int A[],int p,int r){
		
		if (p<r) {
			int q = (p+r)/2;
			BuscarMaximo(A,p,q);
			BuscarMaximo(A,q+1,r);
			combinar(A,p,q,r);
			
		}
	}
	
	
	public static void main(String a[]){
		
		int[] arreglo = {2,3,9,16,22,11,1,0,8};
		System.out.println(Arrays.toString(arreglo));
		
		BuscarMaximo(arreglo,0,arreglo.length-1);
		System.out.println(Arrays.toString(arreglo));
		System.out.println(arreglo[0]);
	}
	
}
