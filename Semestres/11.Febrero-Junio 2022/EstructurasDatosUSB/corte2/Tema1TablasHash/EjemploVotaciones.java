import java.util.HashMap;
import java.util.Scanner;

public class EjemploVotaciones {
    public static void main(String[] args){
        Scanner lector = new Scanner(System.in);
        HashMap<Integer,Integer> votaciones = new HashMap<Integer,Integer>();
        int numero_votantes = lector.nextInt();

        for(int i=0;i<numero_votantes;i++){
            System.out.println("Ingrese el número de cedula");
            int cedula_votante = lector.nextInt();
            int id_candidato = lector.nextInt();
            votaciones.put(cedula_votante, id_candidato);
        }

        System.out.print(votaciones);
         
        HashMap<Integer,Integer> conteo = new HashMap<Integer,Integer>();
        for(int cedula: votaciones.keySet()){
            int candidato = votaciones.get(cedula);
            if(!conteo.containsKey(candidato)){
                conteo.put(candidato,1);
            }
            else{
                conteo.replace(candidato,conteo.get(candidato)+1);
            }
        }

        System.out.println(conteo);
    }
}
