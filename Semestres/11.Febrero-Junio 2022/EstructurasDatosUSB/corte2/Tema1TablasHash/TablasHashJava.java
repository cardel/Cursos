import java.util.HashMap;
import java.util.Random;

public class TablasHashJava{
    public static void main(String args[]){
        HashMap<Integer,Integer> tablaHash = new HashMap<Integer,Integer>();
        tablaHash.put(10,12);
        tablaHash.put(12,20);
        tablaHash.put(10,15);

        for(int i=0;i<100;i++){
            Random r = new Random();
            int numero = Math.abs(r.nextInt()%500);
            int llave = Math.abs(r.nextInt()%500);
            tablaHash.put(llave,numero);
        }
        System.out.println(tablaHash);
        System.out.println(tablaHash.keySet());

        for(int e: tablaHash.keySet()){
            System.out.println(tablaHash.get(e));
        }
    }
}