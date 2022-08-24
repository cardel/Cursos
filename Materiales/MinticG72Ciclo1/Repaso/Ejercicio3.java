/*
 * Carlos A Delgado
 * 23 de junio de 2022
 * Ejercicio3 hecho en Java
 */

import java.util.*;

public class Ejercicio3 {
    public static void main(String[] args) {
        Solucion objSolucion = new Solucion();
        int[][] lista = {{100,10}, {200,20},{300,10},{400,20},{100,20}};
        ArrayList<ArrayList<Integer> > lista_venta =  new ArrayList<ArrayList<Integer>>();

        for(int[] element: lista){
            ArrayList<Integer> aux = new ArrayList<Integer>();
            aux.add(element[0]);
            aux.add(element[1]);
            lista_venta.add(aux);

        }
        System.out.println(objSolucion.generar_venta(lista_venta));
    }
}

class Solucion{

    public int obtener_valor(int cod){
        if(cod==100)
            return 10000;
        else if(cod==200)
            return 30000;
        else if(cod==300)
            return 10000;
        else if(cod==400)
            return 8000;
        else
            return 0;
    }

    public HashMap<String,Double> generar_venta(ArrayList<ArrayList <Integer>> lst_ventas){
        HashMap<String,Double> salida = new  HashMap<String,Double>();
        double subtotal = 0;
        double valor_iva = 0;
        double total = 0;
        for(ArrayList <Integer> venta : lst_ventas){
            subtotal += obtener_valor(venta.get(0))*venta.get(1);
        }
            
        salida.put("subtotal",subtotal);
        valor_iva= Math.round(subtotal*0.19);
        salida.put("iva",valor_iva);
        total = Math.round(subtotal+valor_iva);
        salida.put("total",total);
        return salida;
    }
}

//{'subtotal': 1160000, 'valor_iva': 220400.0, 'total': 1380400.0}

