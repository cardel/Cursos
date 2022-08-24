import java.util.HashMap;
import java.util.LinkedList;

public class TablasHashJavaEjemplo2 {
    public static void main(String[] args){
        HashMap<String,Double> tabla = new HashMap<String,Double>();
        tabla.put("Juanito Arboleda",1.0);
        tabla.put("Pepe Dominguez",3.0);
        tabla.put("José Ortiz",4.8);
        tabla.put("Carlos Delgado",2.5);
        tabla.put("Valentina Rodriguez",1.1);

        System.out.println("El promedio Juanito Arboleda "+tabla.get("Juanito Arboleda"));

        HashMap<String,Double> tablaProductos = new HashMap<String,Double>();
        tablaProductos.put("Banano",20000.0);
        tablaProductos.put("Uva",80000.0);
        tablaProductos.put("Banana",100000.0);
        tablaProductos.put("Brawnie",10000000.0);

        tablaProductos.put("Banano",400000.0);
        tablaProductos.replace("Uva",5000.0);
        System.out.println(tablaProductos);

        HashMap<String,Producto> tablaObjetos = new HashMap<String,Producto>();
        tablaObjetos.put("Banano", new Producto("Banano",50000));
        System.out.println(tablaObjetos);
        
        HashMap<String,LinkedList<Integer> > tablaListaEnlazada = new HashMap<String,LinkedList<Integer> >();
        LinkedList<Integer> lista = new LinkedList<Integer>();
        lista.add(4);
        lista.add(8);
        tablaListaEnlazada.put("Pikachu",lista);

        LinkedList<Integer> lista2 = new LinkedList<Integer>();
        lista2.add(10);
        lista2.add(15);
        lista2.add(18);
        tablaListaEnlazada.put("Kadabra",lista2);
        System.out.println(tablaListaEnlazada);
    }
}

class Producto{
    private String nombre;
    private double valor;

    Producto(String nombre, double valor){
        this.nombre = nombre;
        this.valor = valor;
    }
}
