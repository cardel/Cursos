import java.util.HashMap;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class EjercicioClaseTablaHash {
    public static void main(String args[]){
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Ingrese el número de estudiantes ");
        try{
            HashMap<Integer,Estudiante> students_table = new HashMap<Integer,Estudiante>();
            int students_number = Integer.parseInt(reader.readLine());

            for(int i=0; i<students_number;i++){
                System.out.println("Ingrese los datos del estudiante "+(i+1));

                System.out.println("Ingrese el código");
                int code = Integer.parseInt(reader.readLine());

                System.out.println("Ingrese el nombre ");
                String name = reader.readLine();

                System.out.println("Ingrese la edad");
                int age = Integer.parseInt(reader.readLine());

                System.out.println("Ingrese el promedio");
                double average = Double.parseDouble(reader.readLine());

                Estudiante studentObj = new Estudiante(name, age, average, code);
                students_table.put(code,studentObj);

            }

            //Mostrar información

            for(int code: students_table.keySet()){
                System.out.println(students_table.get(code).toString());
            }
        }
        catch(IOException e){
            System.out.println(e.toString());
        }
        

    }
}
