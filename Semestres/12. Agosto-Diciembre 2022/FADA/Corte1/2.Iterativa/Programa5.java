import java.lang.Math;
public class Programa5{
  public static void main(String[] args) {
    SolucionP4 objsolucionP4 = new SolucionP4();
    objsolucionP4.solucion(25);
  }    
  
}

class SolucionP4{
  public long invarianteb(long a){
    return 1+(a-1)*a;
  }

  public long invariantec(long a){
    return (a == 1) ? 1 : (long)Math.pow(invariantec(a-1),2)+invariantec(a-1);
  }

  public long solucion(int n){
    long a=1,b=1,c=1;
    System.out.println(a+" "+b+" "+c+" "+invarianteb(a)+" "+invariantec(a));
    while(a<=n){
      b+=2*a;
      c+=c*c;
      a+=1;
      System.out.println(a+" "+b+" "+c+" "+invarianteb(a)+" "+invariantec(a));
    }
    return b+c;
  }
}
