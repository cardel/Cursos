/*
 * Carlos Delgado
 * 13 de Octubre de 2022
 */
import java.lang.IndexOutOfBoundsException;
import java.lang.StackOverflowError;


public class Pila {
  int[] arreglo;
  int top;
  int size;

  Pila(int n){
    this.arreglo = new int[n];
    this.top = 0;
    this.size = n;
  }

  public void Push(int x) throws IndexOutOfBoundsException{
    this.top++;
    if(this.top <= this.size){
      arreglo[top-1]=x;
    }
    else{
      throw new IndexOutOfBoundsException();
    }
  }

  public int Pop() throws IndexOutOfBoundsException{
    if(this.top>0){
      int a = arreglo[this.top-1];
      this.top--;
      return a;
    }
    else{
      throw new IndexOutOfBoundsException();
    }
  }


}
