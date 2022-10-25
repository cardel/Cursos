import java.lang.IndexOutOfBoundsException;
import java.lang.UnsupportedOperationException;

public class ListaSimple {
  private NodoSimple head;
  private int size;

  public ListaSimple() {
    this.head = null;
    this.size = 0;
  }

  public void insert(int x) throws UnsupportedOperationException {
    // El primer elemento
    if (this.head == null) {
      NodoSimple objNodo = new NodoSimple(x);
      this.head = objNodo;
    } else {
      NodoSimple objNodo = this.head;
      while (objNodo.getNext() != null) {
        objNodo = objNodo.getNext();
      }
      objNodo.setNext(new NodoSimple(x));
    }
    this.size++;
  }

  public boolean search(int x) {
    NodoSimple objNodo = this.head;
    while (objNodo != null) {
      if (objNodo.getValue() == x) {
        return true;
      }
      objNodo = objNodo.getNext();
    }
    return false;
  }

  public int searchIndex(int idx) throws IndexOutOfBoundsException {
    NodoSimple objNodo = this.head;
    int cnt = 0;
    while (idx < this.size) {
      if (cnt == idx) {
        return objNodo.getValue();
      }
      cnt++;
      objNodo = objNodo.getNext();
    }
    throw new IndexOutOfBoundsException();
  }

  public void removeIndex(int idx) throws UnsupportedOperationException {
    NodoSimple objAnterior = this.head;
    if(idx >= this.size){
      throw new IndexOutOfBoundsException();
    }

    if (idx == 0) { //Cuando borro el primero
      this.head = objAnterior.getNext();
    } else {
      int cnt = 0;
      while (idx < this.size) {
        if (cnt == idx - 1) {
          objAnterior.setNext(objAnterior.getNext().getNext());
          break;
        }
        cnt++;
        objAnterior = objAnterior.getNext();
      }
    }
    this.size--;
  }

  public NodoSimple getHead() {
    return head;
  }

  public void setHead(NodoSimple head) {
    this.head = head;
  }

  public int getSize() {
    return size;
  }

  public void setSize(int size) {
    this.size = size;
  }

}
