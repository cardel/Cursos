import java.util.Random;
import java.util.ArrayList;
import java.util.LinkedList;

public class ListaJavaTiempo2 {
    
    public static void main(String[] args){
        ArrayList<Carro> listaSimple = new ArrayList<Carro>();
        LinkedList<Carro> listaDoble = new LinkedList<Carro>();        

        Random generador = new Random();

        String marca[] = {"Kia","Daewoo","Renault","Chevrolet","Ferrari","Mercedez","Volskwagen"};
        String colores[] = {"Verde","Rojo","Blanco","Azul","Negro","Rosado"};
        long ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            Carro objCarro = new Carro(
                generador.nextInt(2023),
                colores[generador.nextInt(6)],
                marca[generador.nextInt(7)],
                String.valueOf(generador.nextInt(100000))
            );
            listaDoble.add(objCarro);
        }
        long fin = System.currentTimeMillis();
        System.out.println("Tiempo inserción lista doble enlazada (LinkedList)"+(fin-ini)+" ms ");

        ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            Carro objCarro = new Carro(
                generador.nextInt(2023),
                colores[generador.nextInt(6)],
                marca[generador.nextInt(7)],
                String.valueOf(generador.nextInt(100000))
            );
            listaSimple.add(objCarro);
        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo inserción lista simple enlazada (ArrayList) "+(fin-ini)+" ms ");


        ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            Carro objCarro = new Carro(
                generador.nextInt(2023),
                colores[generador.nextInt(6)],
                marca[generador.nextInt(7)],
                String.valueOf(generador.nextInt(100000))
            );
            listaDoble.set(i, objCarro);
        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo modificación lista doble enlazada (Linkedlist) "+(fin-ini)+" ms ");

        ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            Carro objCarro = new Carro(
                generador.nextInt(2023),
                colores[generador.nextInt(6)],
                marca[generador.nextInt(7)],
                String.valueOf(generador.nextInt(100000))
            );
            listaSimple.set(i, objCarro);

        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo modificación lista simple (Arraylist) "+(fin-ini)+" ms ");

        ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            listaDoble.get(i).setColor("red");
            listaDoble.get(i).setModelo(2022);
        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo modificación obj lista doble enlazada (Linkedlist) "+(fin-ini)+" ms ");

        ini = System.currentTimeMillis();
        for(int i=0; i<100000; i++){
            listaSimple.get(i).setColor("red");
            listaSimple.get(i).setModelo(2022);

        }
        fin = System.currentTimeMillis();
        System.out.println("Tiempo modificación obj lista simple (Arraylist) "+(fin-ini)+" ms ");
            

    }
}
