import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Random;

public class ListasTiempo {
    public static void main(String[] args){
        ArrayList<Integer> listaSimple = new ArrayList<Integer>();
        LinkedList<Integer> listaDoble = new LinkedList<Integer>();

        Random generador = new Random();
        long ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            int numero = generador.nextInt(100000);
            listaDoble.add(numero);
        }
        long fin = System.currentTimeMillis();
        System.out.println("Tiempo inserción lista doble enlazada (LinkedList)"+(fin-ini)+" ms ");

        ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            int numero = generador.nextInt(100000);
            listaSimple.add(numero);
        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo inserción lista simple enlazada (ArrayList) "+(fin-ini)+" ms ");



        ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            listaDoble.get(i);
        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo consulta lista doble enlazada (Linkedlist) "+(fin-ini)+" ms ");

        ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            listaSimple.get(i);
        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo consulta lista simple enlazada (ArrayList) "+(fin-ini)+" ms ");

        ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            listaDoble.set(i, generador.nextInt(100000));
        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo modificación lista doble enlazada (Linkedlist) "+(fin-ini)+" ms ");

        ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            listaSimple.set(i, generador.nextInt(100000));
        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo modificación lista simple enlazada (ArrayList) "+(fin-ini)+" ms ");


        ini = System.currentTimeMillis();
        for(int i=5000; i<50000; i++){
            listaDoble.remove(i);
        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo de borrado lista doble enlazada (Linkedlist) "+(fin-ini)+" ms ");

        ini = System.currentTimeMillis();
        for(int i=5000; i<50000; i++){
            listaSimple.get(i);
        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo de borrado lista simple enlazada (ArrayList) "+(fin-ini)+" ms ");


    }   
}
