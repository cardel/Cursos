/*
 * Carlos A Delgado
 * 15 de Octubre de 2022
 * Estructura doblemente enlazada
 */
import java.lang.UnsupportedOperationException;
import java.lang.IndexOutOfBoundsException;
 public class ListaDoblementeEnlazada{

  public NodoDoble head;
  public int size;

  public ListaDoblementeEnlazada(){
    this.size = 0;
    this.head = null;
  }

  public void insert(int x){

    NodoDoble a = new NodoDoble(x, null , this.head);
    if(this.head != null){
      this.head.setPrev(a);
    }
    this.size++;
    this.head = a;
  
  }

  public Boolean search(int x){
    NodoDoble headAux = this.head;
    while(headAux!=null){
      if(headAux.getKey()==x){
        return true;
      }
      headAux = headAux.getNext();
    }
    return false;
  }
  public int index(int idx) throws IndexOutOfBoundsException{
    NodoDoble nodoActual = this.head;
    int cnt = 0;
    while(idx < this.size && nodoActual != null ){      
      if(cnt == idx){
        return nodoActual.getKey();
      }
      nodoActual = nodoActual.getNext();
      cnt++;
    }
    throw new IndexOutOfBoundsException();
    
  }

  public void delete(int x){
    throw new UnsupportedOperationException();
  }
 }
