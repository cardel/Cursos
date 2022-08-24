import java.util.*;


class Main {


  public static void main(String[] args) {
    Warshall objWarshall = new Warshall();

    boolean[][] matrizAdyacencia = {{false,true,false,false},{true, false,true,false},{false,false,false,true},{false,false,false,false}};

    boolean[][] salida = objWarshall.rutinaWarshall(matrizAdyacencia);
    for(int i=0;i<salida.length;i++){
      System.out.println(Arrays.toString(salida[i]));

    }
    
  }
}

class Warshall{

  boolean[][] rutinaWarshall(boolean[][] matrizAdyacencia){
    
    int filas = matrizAdyacencia.length;
    int columnas = matrizAdyacencia[0].length;
    boolean[][] matrizSalida = new boolean[filas][columnas];
    System.out.println(filas);

    for(int i=0; i<filas; i++){
      for(int j=0; j<columnas; j++)
        matrizSalida[i][j] = matrizAdyacencia[i][j];
    }

    for(int k=1; k<=filas; k++){
      for(int i=1; i<=filas; i++){ 
        for(int j=1; j<=filas; j++){
          int posF = i-1;
          int posC = j-1;
          int posK = k-1;
          matrizSalida[posF][posC] = matrizSalida[posF][posC] || (matrizSalida[posF][posK] && matrizSalida[posK][posC]);
        }
      }

    }

    return matrizSalida;

  }
}
