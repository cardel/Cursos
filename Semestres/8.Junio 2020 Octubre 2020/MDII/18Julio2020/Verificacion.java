import java.lang.Math;
public class Verificacion{
	public static long solucionRecursiva(int n){
		if (n==0) return 4;
		if (n==1) return 6;
		
		long f = 3*n + (long)Math.pow(3,n)+1;
		return 2*solucionRecursiva(n-1)-solucionRecursiva(n-2)+f;
	}
	
	public static long solucionEncontrada(int n){
		double salida = 7.0/4-5*n+(1.0/2)*Math.pow(n,3)+2*Math.pow(n,2)+(9.0/4)*Math.pow(3,n);
		
		return (long)salida;
	}
	
	
	public static void main(String a[]){
		for(int i=0; i<30; i++){
			System.out.println(" Recursivo: "+String.valueOf(solucionRecursiva(i))+" Solución: "+String.valueOf(solucionEncontrada(i))+"\n");
		}
	}
	
}
//1.8446744e+19
