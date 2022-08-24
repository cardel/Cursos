import java.util.ArrayList;
import java.util.LinkedList;

public class Listas {
    public static void main(String[] args){
        LinkedList<Integer> listaDobleEnlazada = new LinkedList<Integer>();
        ArrayList<Integer> listaSimpleEnlazada = new ArrayList<Integer>();

        listaDobleEnlazada.add(3);
        listaDobleEnlazada.add(5);
        listaDobleEnlazada.add(10);

        listaSimpleEnlazada.add(21);
        listaSimpleEnlazada.add(22);
        listaSimpleEnlazada.add(43);

        for(int i = 0; i < listaDobleEnlazada.size(); i++){
            System.out.println(listaDobleEnlazada.get(i));
        }

        for(int i=0; i < listaSimpleEnlazada.size(); i++){
            System.out.println(listaSimpleEnlazada.get(i));
        }
    }
}
