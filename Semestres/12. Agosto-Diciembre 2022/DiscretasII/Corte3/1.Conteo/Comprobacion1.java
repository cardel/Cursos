public class Comprobacion1{

  public int div10000(){
    int cnt = 0;
    for(int i=125; i<=10000;i++){
      if(i%7==0 || i%16==0 || i%20==0){
        cnt++;
      }
    }
    return cnt;
  }

  public int formula(){
    int T1 = 10000/7-124/7;
    int T2 = 10000/16-124/16;
    int T3 = 10000/20-124/20;
    int T4 = 10000/112-124/112;
    int T5 = 10000/140-124/140;
    int T6 = 10000/80-124/80;
    int T7 = 10000/560-124/560;
    return T1+T2+T3-T4-T5-T6+T7;

  }
  public static void main(String[] args) {
    Comprobacion1 objComprobacion1 = new Comprobacion1();
    System.out.println(
      objComprobacion1.div10000()
      + " "
      + objComprobacion1.formula()
    );
  }
}
