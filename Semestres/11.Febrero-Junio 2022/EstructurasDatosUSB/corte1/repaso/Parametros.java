import java.util.LinkedList;
import java.util.Arrays;
public class Parametros {
    public static void funcion(LinkedList<Integer> input){
        input.set(0,20);
    }
    public static void main(String[] args){
        Integer arreglo[]= {1,2,3,4,5,6,7,8,9,10};

        LinkedList<Integer> lista = new LinkedList<Integer>();
        lista.addAll(Arrays.asList(arreglo));

        System.out.println(lista);
        funcion((LinkedList<Integer>)lista.clone());
        System.out.println(lista.toString());

    }
}
