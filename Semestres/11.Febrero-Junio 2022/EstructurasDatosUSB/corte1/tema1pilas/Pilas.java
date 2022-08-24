import java.util.Stack;
public class Pilas {
    public static void main(String[] args){
        Stack<Integer> pila = new Stack<Integer>();
        pila.push(4);
        pila.push(7);
        pila.push(9);
        System.out.println(pila.pop());
        System.out.println(pila.pop());
    }
}
