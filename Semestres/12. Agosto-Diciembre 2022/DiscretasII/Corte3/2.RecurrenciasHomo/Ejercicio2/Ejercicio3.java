public class Ejercicio3 {

  public long T(int n){
    if (n==0){
      return 10;
    }
    else{
      if(n==1){
        return 20;
      }
      else{
        if(n==2){
          return 60;
        }
        else{
          return 6*T(n-1)-12*T(n-2)+8*T(n-3);
        }
      }
    }
  }

  public double f(int n){
    return 10.0*Math.pow(2,n)-(5/2.0)*n*Math.pow(2, n)+(5/2.0)*n*n*Math.pow(2,n);
  }
  public static void main(String[] args) {
    Ejercicio3 objEjercicio3 = new Ejercicio3();
    for (int i=0; i<30; i++){
      System.out.println(i+ " " + objEjercicio3.T(i)+ " " + objEjercicio3.f(i));
    }
  }
}
