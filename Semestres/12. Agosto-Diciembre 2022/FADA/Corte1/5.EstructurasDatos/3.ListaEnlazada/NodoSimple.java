public class NodoSimple{
  private NodoSimple next;
  private int value;

  public NodoSimple(int value){
    this.value = value;
  }

  public NodoSimple getNext() {
    return next;
  }
  public void setNext(NodoSimple next) {
    this.next = next;
  }

  public int getValue() {
    return value;
  }

  public void setValue(int value) {
    this.value = value;
  }

}
