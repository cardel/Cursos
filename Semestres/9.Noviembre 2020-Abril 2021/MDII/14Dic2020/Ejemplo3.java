

class Ejemplo3 {

  static double recursivo(int n){
    if(n==0){
      return 4.0;
    }
    else{
      if(n==1){
        return 6.0;
      }
      else{
        return 5.0*recursivo(n-1)-4.0*recursivo(n-2);
      } 
    }

  }

  static double formula(int n){

    double A = 2.0/3.0;
    double B = 10.0/3.0;
    double r1 = Math.pow(4,n);

    return A*r1+B;

  }

  public static void main(String[] args) {
    for(int i=0;i<20;i++){
      String salida=" n "+String.valueOf(i);
      
      String salidaA = " recursiva "+recursivo(i);

      String salidaB = " fórmula "+formula(i);

      salida+=salidaA;
      salida+=salidaB;

      System.out.println(salida);
    }
    
  }
}
