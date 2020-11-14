public class ejemploDouble{

	public static void main(String args[]){
	
		double a = 10d;
		double b = 20.5d;
		double c = 9999.9003906250d;
	
		System.out.println("a: "+a+" b: "+b+" c: "+c);
		System.out.println("a+b+c "+(a+b+c));
		
		/*************Otro tipo de error***************/
		System.out.println("\n LA SUMA MALEFICA :( ");
		double d = 10.00000001d;
		System.out.println(d);
		for(int i=0; i<6; i++){
			
			d += 0.00000001d;
			System.out.println(d);
		}	
		System.out.println("Miremos la suma de otra forma");
		System.out.println(10.00000001d+6*0.00000001d);
		System.out.println("\n Y POR ESTOS ERRORES, JUANITO SE QUEDÓ SIN DINERO EN EL BANCO :(\n NO APOYES LOS ERRORES NUMÉRICOS REALIZANDO MUCHAS OPERACIONES ARIMETICAS SUCESIVAS");
		
	}
}

