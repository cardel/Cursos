public class Ejercicio2
{
  public long T(int n){
    if (n==0){
      return 1;
    }
    else{
      if (n==1){
        return 10;
      }
      else{
        return T(n-1)+T(n-2);
      }
    }
  }

  public double f(int n){
    double raiz5A = (1+Math.sqrt(5))/2.0;
    double raiz5B = (1-Math.sqrt(5))/2.0;
    double B = -10.0/Math.sqrt(5)+1.0/(2.0*Math.sqrt(5))+1/2.0;
    double A= 1 - B;
    return A*Math.pow(raiz5A,n)+B*Math.pow(raiz5B,n);
  }

  public static void main(String[] args) {
    Ejercicio2 objEjercicio2 = new Ejercicio2();
    for (int i=0; i<30; i++){
      System.out.println(i+ " " + objEjercicio2.T(i)+ " " + objEjercicio2.f(i));
    }
  }

}
