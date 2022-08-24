public class Ejercicio2 {
    public static void main(String[] args){
        SolEjercicio2 objEjercicio = new SolEjercicio2();
        System.out.println(objEjercicio.sol_for(0, 100));
        System.out.println(objEjercicio.sol_while(0, 100));
    }
}

class SolEjercicio2{

    public String sol_for(int a,int b){
        String salida="";
        for(int i=a; i<=b;i++){
            salida+=" "+i+" ";
        }
        salida+="\n";
        for(int i=a; i<=b;i=i+2){
            salida+=" "+i+" ";
        }
        salida+="\n";
        for(int i=a; i<=b;i=i+3){
            salida+=" "+i+" ";
        }
        salida+="\n";
        for(int i=a; i<=b;i=i+4){
            salida+=" "+i+" ";
        }
        salida+="\n";
        return salida;
    }

    public String sol_while(int a,int b){
        String salida="";
        int i=a;
        while(i<=b){
            salida+=" "+i+" ";
            i++;
        }
        salida+="\n";
        i=a;
        while(i<=b){
            salida+=" "+i+" ";
            i=i+2;
        }
        i=a;
        salida+="\n";
        while(i<=b){
            salida+=" "+i+" ";
            i=i+3;
        }
        i=a;
        salida+="\n";
        while(i<=b){
            salida+=" "+i+" ";
            i=i+4;
        }

        return salida;
    }
}
