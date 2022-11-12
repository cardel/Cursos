package heap;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestFactory;

public class HeapTest {
  @Test
  void testHeapify() throws Exception {
    int arreglo[] = {4,14,7,2,8,1};
    Heap objHeap = new Heap(
      arreglo,
      10,
      6);

    objHeap.Heapify(1);

    assertEquals("[14, 8, 7, 2, 4, 1]", Arrays.toString(objHeap.getArreglo()));
    
    int arreglo2[] = {6,8,9,2,7,1};
    Heap objHeap2 = new Heap(
      arreglo2,
      10,
      6);

    objHeap2.Heapify(1);

    assertEquals("[9, 8, 6, 2, 7, 1]", Arrays.toString(objHeap2.getArreglo()));
  }

  @Test
  public void testBuildHeap() throws Exception{
    int arreglo[] = {1,8,6,3,7,9,10,2,4};
    Heap objHeap = new Heap(
      arreglo,
      10,
      9);

    objHeap.buildHeap();

    assertEquals("[10, 8, 9, 4, 7, 1, 6, 2, 3]", Arrays.toString(objHeap.getArreglo())); 
    
    int arreglo2[] = {5,7,10,1,4,6,8,2,9,12};
    Heap objHeap2 = new Heap(
      arreglo2,
      10,
      10);

    objHeap2.buildHeap();

    assertEquals("[12, 9, 10, 5, 7, 6, 8, 2, 1, 4]", Arrays.toString(objHeap2.getArreglo())); 
  }

  @Test
  public void testHeapSort() throws Exception{
    int arreglo[] = {1,8,6,3,7,9,10,2,4};
    Heap objHeap = new Heap(
      arreglo,
      10,
      9);
    objHeap.heapSort();

    assertEquals("[1, 2, 3, 4, 6, 7, 8, 9, 10]", Arrays.toString(objHeap.getArreglo())); 


  }
}
