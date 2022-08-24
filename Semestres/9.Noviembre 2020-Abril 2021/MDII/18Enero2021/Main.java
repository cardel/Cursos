class Main {
  
  public static long recursiva(int n){

    if(n==0){
      return 4;
    }  
    else{
      if(n==1){
        return 16;
      }
      else{
        return 4*recursiva(n-1)+4*recursiva(n-2);
      }

    }
    }

  public static double formula(int n){
      double A = 2.0*(1+1.0/Math.sqrt(2.0));
      double B = 2.0*(1-1.0/Math.sqrt(2.0));

      double r1 = A*Math.pow((2.0+2.0*Math.sqrt(2.0)),n);
      double r2 = B*Math.pow((2.0-2.0*Math.sqrt(2.0)),n); 
    
    return r1 + r2;
     
  }
  
  public static void main(String[] args) {
    for(int i=0; i<20; i++){
      System.out.println(" n "+String.valueOf(i)+" Recursivo: "+String.valueOf(recursiva(i))+ " Formula: "+String.valueOf(formula(i)));
    }
  }
}
