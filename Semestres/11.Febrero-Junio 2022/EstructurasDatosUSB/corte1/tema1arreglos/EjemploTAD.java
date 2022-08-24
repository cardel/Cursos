public class EjemploTAD{
    public static void main(String[] args){
        System.out.println(suma(10,12));
        System.out.println(multiplicacion(20,3));
    }
    public static int multiplicacion(int n, int m){
        TAD objTADm = new TAD(m);
        TAD objTADn = new TAD(0);
        while(!objTADm.iszero()){
            objTADn = new TAD(suma(n,objTADn.getValor()));
            objTADm.dec1();
        }
        return objTADn.getValor();
    }
    public static int suma(int n, int m){
        TAD objTADn = new TAD(n);
        TAD objTADm = new TAD(m);

        while(!objTADm.iszero()){
            objTADn.add1(); //Incremento 1 a n
            objTADm.dec1(); //Decremento 1 a m
        }

        return objTADn.getValor();


    }


}
