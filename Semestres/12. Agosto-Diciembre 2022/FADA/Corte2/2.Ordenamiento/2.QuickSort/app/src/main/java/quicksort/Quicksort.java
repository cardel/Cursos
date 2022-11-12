package quicksort;

public class Quicksort{

  private int[] arreglo;

  public Quicksort(int [] arreglo){
    this.arreglo = arreglo;
  }

  public int Partition(int p,int r) throws Exception{
    int i = p;
    int j = r;
    int pivote = this.arreglo[p-1];
    while(i < j){
      while(i <= r && arreglo[i-1]<pivote){
        i++;
      }
      while(j >= 1 && arreglo[j-1]>=pivote){
        j--;
      }

      if(i < j){
        int aux = arreglo[i-1];
        arreglo[i-1]=arreglo[j-1];
        arreglo[j-1]=aux;
      }
    }
    if(j<p){
      j = p;
    }
    return j;
  }

  public int RandomPartition(int p,int r) throws Exception{
    int random = (p-r)*(int)Math.random()+r;
    int i = p;
    int j = r;
    int aux2 = arreglo[i-1];
    arreglo[i-1]=arreglo[random-1];
    arreglo[random-1]=aux2;
    int pivote = this.arreglo[p-1];
    while(i < j){
      while(i <= r && arreglo[i-1]<pivote){
        i++;
      }
      while(j >= 1 && arreglo[j-1]>=pivote){
        j--;
      }

      if(i < j){
        int aux = arreglo[i-1];
        arreglo[i-1]=arreglo[j-1];
        arreglo[j-1]=aux;
      }
    }
    if(j<p){
      j = p;
    }
    return j;
  }
  public void QuicksortR(int p, int r) throws Exception{
    if(p<r){
      int j = Partition(p,r);
      QuicksortR(p,j);
      QuicksortR(j+1,r);
    }
  }
  public void QuicksortRandom(int p, int r) throws Exception{
    if(p<r){
      int j = RandomPartition(p,r);
      QuicksortR(p,j);
      QuicksortR(j+1,r);
    }
  }
  public int[] getArreglo() {
    return arreglo;
  }

  


}
