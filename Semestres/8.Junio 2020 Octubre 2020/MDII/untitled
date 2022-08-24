class Main {
  //R.R torres de hanoi
  public static long H(long n){

    if(n==1){
      return 1;
    }
    else{
      return 2*H(n-1)+1;
    }
  }
  //R.R las cadenas que No tienen dos ceros consecutivos
  public static long P(int n){

    if(n==1) return 2;
    if(n==2) return 3;
    
    return P(n-1)+P(n-2);
  }

  public static void main(String[] args) {
    System.out.println(H(2));
    System.out.println(H(3));
    System.out.println(H(4));
    System.out.println(H(5));
    System.out.println(H(40));
    System.out.println("Segundo problema");
    System.out.println(P(1));
    System.out.println(P(2));
    System.out.println(P(3));
    System.out.println(P(4));
    System.out.println(P(5));
    System.out.println(P(40));
  }
}
