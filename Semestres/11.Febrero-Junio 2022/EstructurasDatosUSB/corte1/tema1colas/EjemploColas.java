import java.util.Queue;
import java.util.LinkedList;
public class EjemploColas {
    public static void main(String[] args){
        Queue<Double> colita = new LinkedList<Double>();
        System.out.println(colita.poll());
        colita.add(10.2);
        colita.add(10.3);
        System.out.println(colita.size());
        System.out.println(colita.poll());
        System.out.println(colita.size());
    }
}
