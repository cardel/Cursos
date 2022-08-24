public class Factorial{
    public static void main(String[] args){
        Ejercicio objEjercicio = new Ejercicio();
        System.out.println(objEjercicio.factorial(5));
        System.out.println(objEjercicio.factorial(20));
        System.out.println(objEjercicio.factorial(2));
    }
}

class Ejercicio{
    public long factorial(long n){
        if(n==1){
            return 1;
        }
        else{
            return n*factorial(n-1);
        }
    }
}