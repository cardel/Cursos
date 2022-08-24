import java.util.LinkedList;
import java.util.Arrays;

public class ListaFactorial{
    public static LinkedList<Long> listaFactoriales(long n, LinkedList<Long> l, Factorial objF){
        if(n==1){
            l.addFirst(objF.calcularFactorial(n));
            return l;
        }
        else{
            l.addFirst(objF.calcularFactorial(n));
            return listaFactoriales(n-1, l, objF);
        }
    }
    public static void main(String[] args){
        Factorial objFactorial = new Factorial();
        int n = 5;
        LinkedList<Long> lista = new LinkedList<Long>();
        for(int i=1; i<=n; i++){
            lista.add(objFactorial.calcularFactorial(i));
        }

        System.out.println(lista.toString());
        System.out.println(listaFactoriales(n, new LinkedList<Long>(),objFactorial).toString());
    }
    
}

class Factorial{
    public long calcularFactorial(long n){
        if(n==1){
            return 1;
        }
        else{
            return n*calcularFactorial(n-1);
        }
    }
}