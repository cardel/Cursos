import java.util.*;

public class Recurrencia{
	
	static double recurrencia(int n){
		if(n==0) return 8.0;
		if(n==1) return 6.0;
		double aux = 5.0*Math.pow(6,n)+2.0*Math.pow(n,2)+4;
		return -5.0*recurrencia(n-1)+6.0*recurrencia(n-2)+aux;
	}
	
	public static void main(String p[]){
		for(int i=0; i<=10; i++){
			
			
			double solucion = (852.0/343.0) + (863.0/343.0)*Math.pow(-6,i)+3*Math.pow(6,i)+(2.0/21.0)*Math.pow(i,3)+(1.0/7.0)*Math.pow(i,2)+(55.0/147.0)*i;
			
			System.out.println(Double.toString(recurrencia(i))+"\t"+Double.toString(solucion));
		}
		
	}
}
