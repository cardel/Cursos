package splitandconquer;

public class BinarySearch {
  public boolean search(int A[], int p, int r, int x){
    if (p < r){
      int q = (r+p)/2;
      if (A[p] == x){
        return true;
      }
      else{
        if (A[p] < x){
          return search(A,q+1,r,x); //Busco a la derecha
        }
        else{
          return search(A, p, q, x); //Busco a la izquierda
        }
      }
    }
    return (A[p] == x);
  }
}
