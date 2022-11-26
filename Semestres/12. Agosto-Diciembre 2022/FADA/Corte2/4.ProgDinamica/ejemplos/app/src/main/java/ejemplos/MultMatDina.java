package ejemplos;

import lombok.Getter;
import lombok.Setter;
import java.util.Arrays;

public class MultMatDina {
  @Getter
  @Setter
  private int[][] m; //Matriz de costos

  @Getter
  @Setter
  private int[][] k; //Matriz de la solución


  public void algoritmoMultiplicacion(int [] p, int size){
    //Casos triviales
    
    m = new int[size][size];
    k = new int[size][size];
    for(int i=0; i<size; i++){
      m[i][i] = 0; //Caso trivial
    }
  
    //Recorrido de la matriz
    int j = 2;

    for(int i = 1, q = j; i <= size && q<=size; i++,q++){
      int min = 0;
      int des = 0;
      for(int k=i; k<q; k++){
        int minI = m[i-1][k-1] + m[k+1-1][q-1] + p[i-1]*p[k]*p[q];
        des = (min == 0) ? k : (minI < min) ? k : des;
        min = (min == 0) ? minI : Math.min(min, minI);
        
      }
      
      m[i-1][q-1] = min;
      k[i-1][q-1] = des;

      if(q == size){
        i = 0;
        j++;
        q = j-1;
      }
    }

    for (int i=0; i<size; i++){
      System.out.println(Arrays.toString(m[i]));
    }
    System.out.println("******************");
    for (int i=0; i<size; i++){
      System.out.println(Arrays.toString(k[i]));
    }
  }

}
