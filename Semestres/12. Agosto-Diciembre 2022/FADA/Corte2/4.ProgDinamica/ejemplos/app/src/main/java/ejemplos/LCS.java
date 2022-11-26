package ejemplos;

import lombok.Getter;
import lombok.Setter;
import java.util.Arrays;

public class LCS {
  @Getter
  @Setter
  private int[][] cost;
  private String sol;

  public void solveLCS(String x, String y){
    x = " "+x;
    y = " "+y;
    sol = "";
  
    cost = new int[x.length()][y.length()];
    for(int i=1; i<x.length(); i++){
      for(int j=1; j<y.length(); j++){
        if(x.charAt(i) == y.charAt(j)){
          cost[i][j] = cost[i-1][j-1] + 1;
        }
        else{
          cost[i][j] = Math.max(cost[i-1][j], cost[i][j-1]);
        }
      }
    }
    for(int i=0; i<x.length(); i++){
      System.out.println(Arrays.toString(cost[i]));
    }
    int i=x.length()-1;
    int j=y.length()-1;
    while(true){
      if(x.charAt(i)==y.charAt(j)){
        sol = x.substring(i, i+1) + sol;
        i--;
        j--;
      }
      else{
        if(cost[i-1][j] >= cost[i][j-1]){
          i--;
        }
        else{
          j--;
        }
      }
      if(i==0 || j==0){
        break;
      }
    }
    System.out.println(sol);
  }
}
