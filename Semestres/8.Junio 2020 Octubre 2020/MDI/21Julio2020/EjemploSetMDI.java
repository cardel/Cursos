import java.util.Set;
import java.util.HashSet;


class EjemploSetMDI {
  public static void main(String[] args) {
    Set<Integer> conjuntoEntero = new HashSet();
    conjuntoEntero.add(1);
    conjuntoEntero.add(2);
    conjuntoEntero.add(3);
    conjuntoEntero.add(1);    

    for(Integer elemento: conjuntoEntero){
        System.out.println("Elemento conjunto A "+String.valueOf(elemento));

    }
    Set<Integer> conjuntoEnteroB = new HashSet();
    conjuntoEnteroB.add(1);
    conjuntoEnteroB.add(2);
    conjuntoEnteroB.add(4);
    conjuntoEnteroB.add(5);

    for(Integer elemento: conjuntoEnteroB){
        System.out.println("Elemento conjunto B "+String.valueOf(elemento));

    }
    
    //Intercepción entre A y B
	Set<Integer> intercepcion = new HashSet();
	intercepcion.addAll(conjuntoEntero);
	intercepcion.retainAll(conjuntoEnteroB);
	
    for(Integer elemento: intercepcion){
        System.out.println("Elemento conjunto A n B "+String.valueOf(elemento));

    }

	//Union entre A y B
	Set<Integer> union = new HashSet();
	union.addAll(conjuntoEntero);
	union.addAll(conjuntoEnteroB);
	
    for(Integer elemento: union){
        System.out.println("Elemento conjunto A u B "+String.valueOf(elemento));

    }
    //Diferencia A - B
 	Set<Integer> diferenciaAB = new HashSet();
	diferenciaAB.addAll(conjuntoEntero);
	diferenciaAB.removeAll(conjuntoEnteroB);
	
    for(Integer elemento: diferenciaAB){
        System.out.println("Elemento conjunto A - B "+String.valueOf(elemento));

    }   
 
    //Diferencia B - A
 	Set<Integer> diferenciaBA = new HashSet();
	diferenciaBA.addAll(conjuntoEnteroB);
	diferenciaBA.removeAll(conjuntoEntero);
	
    for(Integer elemento: diferenciaBA){
        System.out.println("Elemento conjunto B - A "+String.valueOf(elemento));

    }  
    
    Set<String> conjuntoCadenas = new HashSet();
    conjuntoCadenas.add("Hola");
    conjuntoCadenas.add("Adios");
    conjuntoCadenas.add("Broma");
    //Llenar un conjunto con números entre 1 y el 100
    Set<Integer> conjuntoEnteroC = new HashSet();
    for(int i=0; i< 100; i++){
		conjuntoEnteroC.add(i);
	}
  }
}
