package splitandconquer;
import java.util.ArrayList;

public class MergeSort {
  public void merge(int A[], int p, int q, int r){
    ArrayList<Double> L = new ArrayList<Double>();
    ArrayList<Double> R = new ArrayList<Double>();
    
    for(int i=p; i<=q; i++){
      L.add((double)A[i]);
    }
    L.add(Double.POSITIVE_INFINITY);

    for(int i=q+1; i<=r; i++){
      R.add((double)A[i]);
    }
    R.add(Double.POSITIVE_INFINITY);
    
    int li = 0;
    int rj = 0;

    for(int i=p; i<=r; i++){
      if(L.get(li) < R.get(rj)){
        A[i] = L.get(li).intValue();
        li++;
      }
      else{
        A[i] = R.get(rj).intValue();
        rj++;
      }

    }
  }

  public void sort(int[] A, int p, int r){
    if(p<r){
      int q = (p+r)/2;
      sort(A,p,q);
      sort(A,q+1,r);
      merge(A,p,q,r);
    }
  }
}
