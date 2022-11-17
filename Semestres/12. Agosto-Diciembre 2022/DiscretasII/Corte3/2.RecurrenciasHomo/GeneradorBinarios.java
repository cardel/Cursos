import java.util.ArrayList;
import java.util.Arrays;
public class GeneradorBinarios{

  public int formula(int n){
    switch(n){
      case 1:
        return 2;
      case 2:
        return 4;
      case 3:
        return 7;
      default:
        return formula(n-1)+formula(n-2)+formula(n-3);
        
    }
  }

  public int generadorBinarios(int n){
    ArrayList<String> binarios = new ArrayList<String>();
    binarios.add("0");
    binarios.add("1");
    for(int i=2; i<=n; i++){
      ArrayList<String> copiaBinarios = new ArrayList<String>();
      for(String e : binarios){
        if(!e.endsWith("11")){          
          copiaBinarios.add(e+"1"); 
        }
        copiaBinarios.add(e+"0");
      }
      binarios = copiaBinarios;
    }
    System.out.println(Arrays.toString(binarios.toArray()));
    return binarios.size();
  }

  public static void main(String[] args) {
    GeneradorBinarios objGenerador = new GeneradorBinarios();
    for(int i=1; i<=10; i++){
      System.out.println(
        objGenerador.generadorBinarios(i)+
        " " +
        objGenerador.formula(i)
      ); 
    }
    
  }
}
