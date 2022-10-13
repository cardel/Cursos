import java.util.Arrays;

public class PilaColaUso {

  public void testPila(){
    Pila objPila = new Pila(5);
    objPila.Push(10);
    System.out.println(Arrays.toString(objPila.arreglo));
    objPila.Push(12);
    System.out.println(Arrays.toString(objPila.arreglo));
    objPila.Push(212);
    System.out.println(Arrays.toString(objPila.arreglo));
    objPila.Push(4);
    objPila.Push(2);
    System.out.println(Arrays.toString(objPila.arreglo));
    //objPila.Push(100);
    System.out.println(objPila.top);
    objPila.Pop();
    objPila.Pop();
    System.out.println(Arrays.toString(objPila.arreglo));
    System.out.println(objPila.top);
    objPila.Push(-3);
    System.out.println(Arrays.toString(objPila.arreglo));
    objPila.Push(-10);
    System.out.println(Arrays.toString(objPila.arreglo));

  }

  public void testCola(){
    Cola objCola = new Cola(5);
    objCola.enqueue(10);
    System.out.println(Arrays.toString(objCola.arreglo));
    System.out.println(objCola.head+" "+objCola.tail);

    objCola.enqueue(12);
    System.out.println(Arrays.toString(objCola.arreglo));
    System.out.println(objCola.head+" "+objCola.tail);

    objCola.enqueue(212);
    System.out.println(Arrays.toString(objCola.arreglo));
    System.out.println(objCola.head+" "+objCola.tail);

    objCola.enqueue(4);
    objCola.enqueue(2);
    System.out.println(Arrays.toString(objCola.arreglo));
    System.out.println(objCola.head+" "+objCola.tail);

    //objPila.Push(100);
    objCola.dequeue();
    objCola.dequeue();
    System.out.println(Arrays.toString(objCola.arreglo));
    System.out.println(objCola.head+" "+objCola.tail);

    objCola.enqueue(-3);
    System.out.println(Arrays.toString(objCola.arreglo));
    System.out.println(objCola.head+" "+objCola.tail);

    objCola.enqueue(-10);
    System.out.println(Arrays.toString(objCola.arreglo));
    System.out.println(objCola.head+" "+objCola.tail);

    System.out.println(objCola.dequeue());

  }
  public static void main(String[] args){
    PilaColaUso objPilaColaUso = new PilaColaUso();
    objPilaColaUso.testPila();
    objPilaColaUso.testCola();
  }
}
