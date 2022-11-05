
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;

public class bstTest {
  @Test
  void testDelete() throws Exception{
    bst raiz = new bst(null, null, 10, null);
    raiz.insert(12);
    raiz.insert(15);
    raiz.insert(3);
    raiz.insert(8);
    raiz.insert(22); 
    raiz.insert(13);
    raiz.insert(9);
    raiz.insert(11);

    raiz.delete(22);
    raiz.delete(8);
    raiz.delete(12);
 
    assertEquals(raiz.inorder(), "3 9 10 11 13 15");

  }

  @Test
  void testInorder() throws Exception{
    bst raiz = new bst(null,null,10,null);
    bst nodo1 = new bst(null, null, 8,raiz);
    bst nodo2 = new bst(null, null,13,raiz);
    raiz.setLeft(nodo1);
    raiz.setRight(nodo2);

    bst nodo3 = new bst(null,null,3,nodo1);
    nodo1.setLeft(nodo3);

    assertEquals(raiz.inorder(), "3 8 10 13");

  }

  @Test
  void testInsert() throws Exception{
      bst raiz = new bst(null, null, 10, null);
      raiz.insert(12);
      raiz.insert(15);
      raiz.insert(3);
      raiz.insert(8);
      raiz.insert(22);

      assertEquals(raiz.inorder(), "3 8 10 12 15 22");

  }

  @Test
  void testSearch()  throws Exception{
    bst raiz = new bst(null, null, 10, null);
    raiz.insert(12);
    raiz.insert(15);
    raiz.insert(3);
    raiz.insert(8);
    raiz.insert(22); 
    raiz.insert(13);
    raiz.insert(9);
    raiz.insert(11);
    
    assertEquals(raiz.search(11), raiz.getRight().getLeft());
    assertEquals(raiz.search(9), raiz.getLeft().getRight().getRight());

    assertThrows(NullPointerException.class, () -> raiz.search(4));
  }

  @Test
  void testSuccessor() throws Exception{
    bst raiz = new bst(null, null, 10, null);
    raiz.insert(12);
    raiz.insert(15);
    raiz.insert(3);
    raiz.insert(8);
    raiz.insert(22); 
    raiz.insert(13);
    raiz.insert(9);
    raiz.insert(11);

    assertEquals(raiz.successor(9),raiz);
    assertEquals(raiz.successor(12),raiz.getRight().getRight().getLeft());
    assertThrows(NullPointerException.class, () -> raiz.successor(22));
    assertThrows(NullPointerException.class, () -> raiz.successor(30));
   
  }

  @Test
  void testMaximmum() throws Exception{
    bst raiz = new bst(null, null, 10, null);
    raiz.insert(12);
    raiz.insert(15);
    raiz.insert(3);
    raiz.insert(8);
    raiz.insert(22); 
    raiz.insert(13);
    raiz.insert(9);
    raiz.insert(11);
    assertEquals(raiz.maximmum(), raiz.getRight().getRight().getRight());
  }

  @Test
  void testMinimmum() throws Exception{
    bst raiz = new bst(null, null, 10, null);
    raiz.insert(12);
    raiz.insert(15);
    raiz.insert(3);
    raiz.insert(8);
    raiz.insert(22); 
    raiz.insert(13);
    raiz.insert(9);
    raiz.insert(11);
    assertEquals(raiz.minimmum(), raiz.getLeft());
    
  }
}
