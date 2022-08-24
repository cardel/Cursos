public class Binding{
    static int x = 3;

    public  static void funcion(int x){
        System.out.println(x);
    }
    public static void main(String args[]){
        System.out.println(x);
        int x = 4;
        funcion(20);
        System.out.println(x);
    }
}