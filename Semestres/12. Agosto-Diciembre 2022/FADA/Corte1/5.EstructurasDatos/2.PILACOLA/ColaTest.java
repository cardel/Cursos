/*
 * Carlos A Delgado
 * 15 de Oct de 2022
 * Test para la cola
 */
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.beans.Transient;
import java.lang.IndexOutOfBoundsException;
public class ColaTest {
  @Test
  void testBuildCola(){
    Cola objCola = new Cola(10);
    assertEquals(objCola.arreglo.length,10);
    assertEquals(objCola.head,1);
    assertEquals(objCola.tail,1);
    assertEquals(objCola.size,0);
    assertEquals(objCola.size_max,10);
  }
  @Test
  void enqueueTest(){
    Cola objCola = new Cola(5);
    objCola.enqueue(10);
    assertEquals(objCola.head,1);
    assertEquals(objCola.tail,2);
    objCola.enqueue(12);
    assertEquals(objCola.head,1);
    assertEquals(objCola.tail,3);
    objCola.enqueue(15);
    objCola.enqueue(13);
    objCola.enqueue(12);
    assertEquals(objCola.head,1);
    assertEquals(objCola.tail,1);
    assertThrows(IndexOutOfBoundsException.class,() -> {objCola.enqueue(12);},"IndexBound exception");
    assertEquals(objCola.head,1);
    assertEquals(objCola.tail,1);    
  }

  @Test
  void testDequeue(){
    Cola objCola = new Cola(3);
    assertThrows(IndexOutOfBoundsException.class,() -> {objCola.dequeue();}, "Indexbound exception");
    objCola.enqueue(10);
    objCola.enqueue(20);
    objCola.enqueue(30);
    assertEquals(objCola.dequeue(),10);
    objCola.enqueue(20);
    assertEquals(objCola.head,2);
    assertEquals(objCola.tail,2);

  }
}
