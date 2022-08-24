public class Hanoi{
	
	public static long calcularHannoi(int n){
		if(n == 1) return 1;
		return 1+2*calcularHannoi(n-1);
	}
	
	public static void main(String args[]){
		
		System.out.println(calcularHannoi(2));
		System.out.println(calcularHannoi(7));
		System.out.println(calcularHannoi(20));
	}
}
