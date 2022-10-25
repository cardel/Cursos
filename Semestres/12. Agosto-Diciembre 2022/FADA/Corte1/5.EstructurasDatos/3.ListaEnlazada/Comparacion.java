
public class Comparacion{

  public void prueba(){
    ListaDoblementeEnlazada objListaDoble = new ListaDoblementeEnlazada();
    ListaSimple objListaSimple = new ListaSimple();

    long ini = System.currentTimeMillis();
    for(int i=0; i<100000; i++){
      objListaSimple.insert(i);
    }
    long fin = System.currentTimeMillis();
    System.out.println("Tiempo de lista simple "+String.valueOf(fin-ini));
    ini = System.currentTimeMillis();
    for(int i=0; i<100000; i++){
      objListaDoble.insert(i);
    }
    fin = System.currentTimeMillis();
    System.out.println("Tiempo de lista doble "+String.valueOf(fin-ini));

  }
  public static void main(String[] args){
    Comparacion objComparacion = new Comparacion();
    objComparacion.prueba();
  }
}
