import java.util.ArrayList;
import java.util.LinkedList;

public class Lista3Java {

    public static void modificar(ArrayList<String> input){
        ArrayList<String> aux = (ArrayList<String>)input.clone();
        aux.set(0,"Mundito");
    }
    public static void main(String[] args){
        LinkedList<String> listaDoble = new LinkedList<String>();
        ArrayList<String> listaSimple = new ArrayList<String>();
        String[] arreglo = {"Hola","Carlos", "Juan","Pedro"};

        listaDoble.add("Hola");
        listaDoble.add("Carlos");
        listaDoble.add("Pedro");
        listaDoble.add("Juan");

        listaSimple.add("Hola");
        listaSimple.add("Carlos");
        listaSimple.add("Pedro");
        listaSimple.add("Juan");

        //Copio las estructuras listas, arreglos
        LinkedList<String> listaDoble2 = (LinkedList<String>)listaDoble.clone();
        ArrayList<String> listaSimple2 = (ArrayList<String>)listaSimple.clone();
        String[] arreglo2 = arreglo.clone();

        listaDoble2.set(0,"Mundo");
        listaSimple2.set(0,"Mundo");
        arreglo2[0] = "Mundo";

        System.out.println(listaDoble.get(0)+" "+listaDoble2.get(0));
        System.out.println(listaSimple.get(0)+" "+listaSimple2.get(0));
        System.out.println(arreglo[0]+" "+arreglo2[0]);

        System.out.println(listaSimple.get(0));
        modificar(listaSimple);
        System.out.println(listaSimple.get(0));        
    }
}
