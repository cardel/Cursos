import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

import java.lang.IndexOutOfBoundsException;

public class TestDoblementeEnlazada {
  @Test
  public void BuildDoblementeEnlazadaTest(){
    ListaDoblementeEnlazada objLst = new ListaDoblementeEnlazada();
    assertEquals(objLst.head, null);
    assertEquals(objLst.size, 0);
  }

  @Test
  public void InsertTest(){
    ListaDoblementeEnlazada objLst = new ListaDoblementeEnlazada();
    objLst.insert(10);
    assertEquals(objLst.head.getKey(),10);
    assertEquals(objLst.size,1);

    objLst.insert(20);
    assertEquals(objLst.head.getKey(),20);
    assertEquals(objLst.size,2);
    assertEquals(objLst.head.getNext().getKey(),10);
    assertEquals(objLst.head.getNext().getPrev().getKey(),20);
    assertEquals(objLst.size,2);

    objLst.insert(13);
    assertEquals(objLst.head.getKey(),13);
    assertEquals(objLst.head.getNext().getKey(),20);
    assertEquals(objLst.head.getNext().getNext().getKey(),10);
    assertEquals(objLst.size,3);
    assertEquals(objLst.head.getNext().getPrev().getKey(),13);
    assertEquals(objLst.head.getNext().getNext().getPrev().getKey(),20);    
  }

  @Test
  public void testSearch(){
    ListaDoblementeEnlazada objLst = new ListaDoblementeEnlazada();
    objLst.insert(10);
    objLst.insert(20);
    objLst.insert(30);
    objLst.insert(40);

    assertTrue(objLst.search(30));
    assertFalse(objLst.search(32));

  }

  @Test
  public void indexTest(){
    ListaDoblementeEnlazada objLst = new ListaDoblementeEnlazada();
    objLst.insert(10);
    objLst.insert(20);
    objLst.insert(30);
    objLst.insert(40);
    
    assertEquals(objLst.index(0),40);
    assertEquals(objLst.index(1),30);
    assertEquals(objLst.index(2),20);
    assertEquals(objLst.index(3),10);
    assertThrows(IndexOutOfBoundsException.class,() -> {objLst.index(4);},"Indexbound exceptions expected");
  }
}
