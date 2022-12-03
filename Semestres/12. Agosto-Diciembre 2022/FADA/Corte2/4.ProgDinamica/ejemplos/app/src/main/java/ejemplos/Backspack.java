package ejemplos;

import java.util.Arrays;
import java.util.Comparator;
import java.util.LinkedList;

public class Backspack {
  public void algorithm(int [] w , int[] b, int M){
    int numElm = w.length;
    int bmax[][]= new int[M+1][numElm];
    //Llenar cuando solo un elemento

    for(int i=0; i<M+1; i++){
      bmax[i][0] = (i >= w[0]) ? b[0]  : 0;
    }
    for (int j=1; j<numElm; j++){
      for(int i=0; i<M+1; i++){
        bmax[i][j] = Math.max(
          bmax[i][j-1], //No llevarlo
          (i - w[j] >= 0) ? bmax[i-w[j]][j-1]+b[j] : 0 //Llevarlo
        );
      }
    }
    boolean x[] = new boolean[numElm];
    int i = M;
    int j = numElm-1;

    while (j > 0)
    {
      x[j] = (bmax[i][j] == bmax[i][j-1]) ? false : true;
      i = (bmax[i][j] == bmax[i][j-1]) ? i : i - w[j];
      j = j - 1;

    }

    x[0] = (bmax[i][0] > 0) ? true : false;


    for (int k = 0; k<M+1; k++){
      System.out.println(Arrays.toString(bmax[k]));
    }

    System.out.println(Arrays.toString(x));
  }

  
  public void backpackVoraz(int [] w , int[] b, int M)
  {
    LinkedList<LinkedList<Double>> bw = new LinkedList< LinkedList<Double> >();
    for(int i=0; i<w.length; i++)
    {
      LinkedList<Double> a = new LinkedList<Double>();
      a.add((double)i);
      a.add(w[i]/(double)b[i]);
      bw.add(i, a);
    }

    bw.sort(new ComparatorArray());
    System.out.println(Arrays.toString(bw.toArray()));

    boolean x[] = new boolean[w.length];
    int capacidad = M;
    for (LinkedList<Double> elm : bw) {
      int index = (int) elm.get(0).doubleValue();

      x[index] = (capacidad >= w[index]) ? true : false;
      capacidad = (capacidad >= w[index]) ? capacidad - w[index] : capacidad;
      
    }
    System.out.println(Arrays.toString(x));


  }
  
}
class ComparatorArray implements Comparator<LinkedList<Double>>{

  public int compare(LinkedList<Double> a, LinkedList<Double> b)
    {
      return (a.get(1) <= b.get(1)) ? 1 : -1;
    }
  }


