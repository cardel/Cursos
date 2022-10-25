import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

import java.lang.IndexOutOfBoundsException;
import java.lang.NullPointerException;

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

  @Test
  public void deleteIndexTest(){
    ListaDoblementeEnlazada objLst = new ListaDoblementeEnlazada();
    objLst.insert(10); //3
    objLst.insert(20); //2 
    objLst.insert(30); //1
    objLst.insert(40); //0   
    assertEquals(objLst.size,4);
    objLst.deleteIndex(2); //Borrar el tercer elemento (20)

    assertEquals(objLst.index(0),40);
    assertEquals(objLst.index(1),30);
    assertEquals(objLst.index(2),10);
    assertEquals(objLst.size,3);
    assertThrows(IndexOutOfBoundsException.class,() -> objLst.index(3),"IndexBoundException expected");
    assertThrows(IndexOutOfBoundsException.class,() -> objLst.deleteIndex(5),"IndexOutOfBoundsException expected");

    objLst.deleteIndex(0); 
    assertEquals(objLst.index(0),30);
    assertEquals(objLst.index(1),10);
    assertEquals(objLst.size,2);

    objLst.deleteIndex(1); 
    assertEquals(objLst.size,1);
    assertEquals(objLst.index(0),30);
    assertThrows(IndexOutOfBoundsException.class,() -> objLst.deleteIndex(2),"IndexOutOfBoundsException expected");
  }

  
  @Test
  public void deleteValueTest(){
    ListaDoblementeEnlazada objLst = new ListaDoblementeEnlazada();
    objLst.insert(10); //3
    objLst.insert(20); //2 
    objLst.insert(30); //1
    objLst.insert(40); //0   
    assertEquals(objLst.size,4);
    objLst.deleteValue(20); //Borrar el tercer elemento (20)

    assertEquals(objLst.index(0),40);
    assertEquals(objLst.index(1),30);
    assertEquals(objLst.index(2),10);
    assertEquals(objLst.size,3);
    assertThrows(IndexOutOfBoundsException.class,() -> objLst.index(3),"IndexBoundException expected");
    assertThrows(IndexOutOfBoundsException.class,() -> objLst.deleteIndex(5),"IndexOutOfBoundsException expected");

    objLst.deleteValue(40); 
    assertEquals(objLst.index(0),30);
    assertEquals(objLst.index(1),10);
    assertEquals(objLst.size,2);

    objLst.deleteValue(10); 
    assertEquals(objLst.size,1);
    assertEquals(objLst.index(0),30);
    assertThrows(IndexOutOfBoundsException.class,() -> objLst.deleteIndex(2),"IndexOutOfBoundsException expected");
  }
}
