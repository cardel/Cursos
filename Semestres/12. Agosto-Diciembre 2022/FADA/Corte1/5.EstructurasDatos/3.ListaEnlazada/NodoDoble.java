/*
 * Nodo doblemente enlazado
 * Carlos Delgado
 * 15 de Octubre de 2022
 */

 public class NodoDoble{
  private int key;
  private NodoDoble prev;
  private NodoDoble next;

  public NodoDoble(int key, NodoDoble prev, NodoDoble next){
    this.key = key;
    this.prev = prev;
    this.next = next;
  }

  public int getKey() {
    return key;
  }

  public void setKey(int key) {
    this.key = key;
  }

  public NodoDoble getPrev() {
    return prev;
  }

  public void setPrev(NodoDoble prev) {
    this.prev = prev;
  }

  public NodoDoble getNext() {
    return next;
  }

  public void setNext(NodoDoble next) {
    this.next = next;
  }
  

 }
