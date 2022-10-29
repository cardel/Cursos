import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

import java.lang.IndexOutOfBoundsException;
import java.lang.NullPointerException;

public class TablasHashTest{

  @Test
  public void testTablaHash() throws Exception{
    TablasHash objTablasHash = new TablasHash(10);
    assertEquals(objTablasHash.getSize(),10);
  }

  @Test
  public void testSearch() throws Exception{
    TablasHash objTablasHash = new TablasHash(10);
    assertFalse(objTablasHash.search(10, 20));
    
  }

  @Test
  public void insertionTest() throws Exception{
    TablasHash objTablasHash = new TablasHash(10);
    objTablasHash.insert(1000,10);
    objTablasHash.insert(10,20);
    objTablasHash.insert(30,10);


    assertTrue(objTablasHash.search(1000, 10));
    assertTrue(objTablasHash.search(10, 20));
    assertTrue(objTablasHash.search(1000, 20));

    //Como hay una colisión entonces las llaves 1000 y 10 dan en la misma posición

  }

  @Test
  public void testDelete() throws Exception{
    TablasHash objTablasHash = new TablasHash(10);
    objTablasHash.insert(1000,10);
    objTablasHash.insert(10,20);
    objTablasHash.insert(30,10);


    assertTrue(objTablasHash.search(1000, 10));
    assertTrue(objTablasHash.search(10, 20));
    assertTrue(objTablasHash.search(1000, 20));  
    
    objTablasHash.delete(1000, 10);
    assertTrue(objTablasHash.search(1000, 10));

    objTablasHash.delete(30, 15);


  }
}
