public class FactorialCola{
    public static void main(String[] args){
        EjercicioCola objEjercicio = new EjercicioCola();
        System.out.println(objEjercicio.factorial(5,1));
        System.out.println(objEjercicio.factorial(20,1));
        System.out.println(objEjercicio.factorial(2,1));
    }
}

class EjercicioCola{
    public long factorial(int n, long res ){
        if(n==1){
            return res;
        }
        else{
            return factorial(n-1,n*res);
        }
    }
}