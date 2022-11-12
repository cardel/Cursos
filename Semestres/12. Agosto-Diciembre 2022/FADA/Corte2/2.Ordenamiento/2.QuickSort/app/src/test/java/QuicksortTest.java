import org.junit.jupiter.api.Test;

import quicksort.Quicksort;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;

public class QuicksortTest {
  @Test
  public void testPartition() throws Exception{
    int arreglo[] = {5,3,2,6,4,1,3,7};

    Quicksort objQuicksort = new Quicksort(arreglo);
    int j = objQuicksort.Partition(1,8);

    assertEquals(j,5);
    assertEquals(Arrays.toString(objQuicksort.getArreglo()),"[3, 3, 2, 1, 4, 6, 5, 7]");

  }

  @Test
  public void testQuicksortR() throws Exception{
    int arreglo[] = {5,3,2,6,4,1,3,7};

    Quicksort objQuicksort = new Quicksort(arreglo);
    objQuicksort.QuicksortR(1,8);

    assertEquals(Arrays.toString(objQuicksort.getArreglo()),"[1, 2, 3, 3, 4, 5, 6, 7]");

  }
}
