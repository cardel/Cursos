/*
 * Carlos A Delgado
 * 23 de Junio de 2022
 * Ejercicio 4 de práctica
 */
import java.util.*;
public class Ejercicio4 {
    public static void main(String[] args){
        Solucion4 objSolucion = new Solucion4();
        ArrayList<HashMap<String, Integer>> lista = new ArrayList<HashMap<String, Integer>>();

        HashMap<String, Integer> h1 = new HashMap<String, Integer>();
        h1.put("Carros chocones",10);
        h1.put("Sillas voladoras",20);
        h1.put("Circo",10);
        h1.put("Paseo romántico",20);

        HashMap<String, Integer> h2 = new HashMap<String, Integer>();
        h2.put("Carros chocones",4);
        h2.put("Sillas voladoras",20);
        h2.put("Circo",3);
        h2.put("Paseo romántico",5);

        HashMap<String, Integer> h3 = new HashMap<String, Integer>();
        h3.put("Carros chocones",2);
        h3.put("Sillas voladoras",20);
        h3.put("Circo",1);
        h3.put("Paseo romántico",8);

        lista.add(h1);
        lista.add(h2);
        lista.add(h3);

        System.out.println(objSolucion.determinar_atraccion(lista));

    }
}


class Solucion4{

    public int obtener_valor_atraccion(String atraccion){
        if(atraccion.equals("Carros chocones"))
            return 10000;
        else if(atraccion.equals("Sillas voladoras"))
            return 4000;
        else if(atraccion.equals("Circo"))
            return 15000;
        else if(atraccion.equals("Paseo romántico"))
            return 20000;
        else
            return 0;
    }

    public HashMap<String,Integer> determinar_atraccion(ArrayList<HashMap<String,Integer >> lst_tickets){
        HashMap<String,Integer> salida = new HashMap<String,Integer>();
        int acc_carros_chocones = 0;
        int acc_sillas_voladoras = 0;
        int acc_circo = 0;
        int acc_paseo = 0;
        for(HashMap<String,Integer> ticket_diario: lst_tickets){
            acc_carros_chocones += ticket_diario.get("Carros chocones");
            acc_sillas_voladoras += ticket_diario.get("Sillas voladoras");
            acc_circo += ticket_diario.get("Circo");
            acc_paseo += ticket_diario.get("Paseo romántico");
        }

        int valor_carros_chocones = acc_carros_chocones*obtener_valor_atraccion("Carros chocones");
        int valor_sillas_voladoras = acc_sillas_voladoras*obtener_valor_atraccion("Sillas voladoras");
        int valor_circo = acc_circo*obtener_valor_atraccion("Circo");
        int valor_paseo = acc_paseo*obtener_valor_atraccion("Paseo romántico");
    
        salida.put("Carros chocones",valor_carros_chocones);
        salida.put("Sillas voladoras", valor_sillas_voladoras);
        salida.put("Circo", valor_circo);
        salida.put("Paseo romántico", valor_paseo);
    
        return salida;

    }
}