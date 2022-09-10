public class Raiz{
  public static void main(String args[]){
    Ejercicio objEjercicio = new Ejercicio();
    System.out.println(objEjercicio.estimacion_raiz(7, 0.00001));
    System.out.println(objEjercicio.estimacion_raiz(2, 0.00001));
    System.out.println(objEjercicio.estimacion_raiz(114, 0.00001));

  }
}
class Ejercicio{
  public double estimacion_raiz(double x,double d){
    double a = 1.0;
    int i = 1;
    System.out.println(i+" "+a);
    while(Math.abs(x-a*a)>d){
      i++;
      a = (a+x/a)/2;
      System.out.println(i+" "+a);
    }
    return a;
  }
}
