/*
 * Carlos A Delgado
 * 15 de Octubre de 2022
 * Cola y pila en java
 */
import java.util.Stack;
import java.util.Queue;
import java.util.Arrays;
import java.util.LinkedList;
public class EstructuraColaPila {
  
  public void Stack(){
    //Integer, Double
    Stack<Integer> stack = new Stack<Integer>();
    stack.push(10);
    stack.push(20);
    System.out.println(stack.peek());
    stack.push(30);
    System.out.println(stack.peek());
    
    System.out.println(Arrays.toString(stack.stream().mapToInt(x -> x*x*x).toArray()));

  }

  public void Queue(){
    Queue<Double> queue = new LinkedList<Double>();
    queue.add(10.2);
    queue.add(12.0);
    System.out.println(queue.peek());
    queue.poll();
    System.out.println(queue.peek());
  }
  
  public static void main(String args[]){
    EstructuraColaPila objMain = new EstructuraColaPila();
    objMain.Stack();
    objMain.Queue();
  }
}
