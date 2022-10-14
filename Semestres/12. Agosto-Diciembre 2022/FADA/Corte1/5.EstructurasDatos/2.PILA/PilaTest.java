import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertThrows;
import java.lang.IndexOutOfBoundsException;

public class PilaTest {

  @Test
  void pilaCreacion(){
    
    Pila objPila = new Pila(10);
    //Verifico si el top de la pila es igual 0
    assertEquals(objPila.top,0);
    //Verifico si el tamaño de la pila es igual a n
    assertEquals(objPila.size,10);
    //Verifico si el tamaño del arreglo de la pila es igual a n
    assertEquals(objPila.arreglo.length,10);
  }
  
  @Test
  void pushTest(){
    Pila objPila = new Pila(5);
    objPila.Push(5);
    objPila.Push(10);
    assertEquals(objPila.top,2);
    objPila.Push(4);
    objPila.Push(12);
    assertEquals(objPila.top,4);
    objPila.Push(12);
    assertEquals(objPila.top,5);
    
  }

  @Test
  void testPop(){
    Pila objPila = new Pila(5);
    objPila.Push(5);
    objPila.Push(10);
    assertEquals(objPila.Pop(),10);   
    assertEquals(objPila.Pop(),5);   
    assertThrows(IndexOutOfBoundsException.class, () -> {objPila.Pop();}, "IndexBoundsException expected");   
  }
}
