import java.util.HashMap;
import java.util.Map;

public class TablaHashJava {
  public static void main(String[] args){
    HashMap objHashMap = new HashMap<String,Integer>();
    objHashMap.put("var1",100);
    objHashMap.put("var2",140);
    objHashMap.put("var3",150);
    System.out.println(objHashMap);


    for(Object k: objHashMap.keySet()){
      System.out.println((String) k);
    }
    for(Object v: objHashMap.values()){
      System.out.println((Integer) v);
    }

    Map objMap = new HashMap<String,Object>();
    objMap.put("Nombre","Carlos");
    objMap.put("Apellido","Delgado");
    objMap.put("Edad",35);
    System.out.println(objMap);
  }
}
