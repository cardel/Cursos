package splitandconquer;

public class Minimum {
  public int Conquer(int [] A, int p, int q){
      return Math.min(A[p],A[q]);
  }
  public int getMinimum(int [] A, int p, int r){

    if(p<r){
      int q = (p+r)/2;
      int minL = getMinimum(A, p, q);
      int minR = getMinimum(A, q+1, r);
      int minRL = Conquer(A, p, q);
      return Math.min(minL,Math.min(minR,minRL));
    }
    return A[p]; //Caso Trivial
  }
}
