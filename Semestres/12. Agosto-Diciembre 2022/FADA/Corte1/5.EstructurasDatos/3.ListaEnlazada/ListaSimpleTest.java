import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

import java.lang.IndexOutOfBoundsException;
import java.lang.NullPointerException;

public class ListaSimpleTest {
  @Test
  public void testListaSimple(){
    ListaSimple objListaSimple = new ListaSimple();
    assertEquals(objListaSimple.getSize(),0);
    assertEquals(objListaSimple.getHead(),null);
  }

  @Test
  public void insertionTest(){
    ListaSimple objListaSimple = new ListaSimple();
    objListaSimple.insert(10);
    assertEquals(objListaSimple.getSize(),1);
    objListaSimple.insert(20);
    assertEquals(objListaSimple.getSize(),2);
    objListaSimple.insert(30);
    assertEquals(objListaSimple.getSize(),3);

    assertEquals(objListaSimple.getHead().getValue(),10);
    assertEquals(objListaSimple.getHead().getNext().getValue(),20);
    assertEquals(objListaSimple.getHead().getNext().getNext().getValue(),30);
  }

  @Test
  public void searchTest(){
    ListaSimple objListaSimple = new ListaSimple();
    objListaSimple.insert(10);
    objListaSimple.insert(20);
    objListaSimple.insert(30);

    assertTrue(objListaSimple.search(10));
    assertTrue(objListaSimple.search(20));
    assertTrue(objListaSimple.search(30));
    assertFalse(objListaSimple.search(60));

  }

  @Test
  public void indexTest(){
    ListaSimple objListaSimple = new ListaSimple();
    objListaSimple.insert(10);
    objListaSimple.insert(20);
    objListaSimple.insert(30);

    assertEquals(objListaSimple.searchIndex(0),10);
    assertEquals(objListaSimple.searchIndex(1),20);
    assertEquals(objListaSimple.searchIndex(2),30);
    assertThrows(IndexOutOfBoundsException.class, () -> objListaSimple.searchIndex(3),"IndexBound expected");

  }

  @Test
  public void removeIndexTest(){
    ListaSimple objListaSimple = new ListaSimple();
    objListaSimple.insert(10);
    objListaSimple.insert(20);
    objListaSimple.insert(30);
    
    objListaSimple.removeIndex(1);
    assertEquals(objListaSimple.searchIndex(0),10);
    assertEquals(objListaSimple.searchIndex(1),30);
    assertThrows(IndexOutOfBoundsException.class, () -> objListaSimple.searchIndex(2),"IndexBound expected");
    assertEquals(objListaSimple.getSize(),2);

    objListaSimple.removeIndex(1);
    assertEquals(objListaSimple.searchIndex(0),10);
    assertThrows(IndexOutOfBoundsException.class, () -> objListaSimple.searchIndex(1),"IndexBound expected");
    assertEquals(objListaSimple.getSize(),1);
  }
}
