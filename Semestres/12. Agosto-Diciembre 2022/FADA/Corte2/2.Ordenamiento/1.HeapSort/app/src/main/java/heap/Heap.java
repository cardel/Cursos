package heap;

import javax.naming.OperationNotSupportedException;

public class Heap {
  private int[] arreglo;
  private int size_array;
  private int size_heap;


  public Heap(int size_array) {
    this.size_array = size_array;
    this.arreglo = new int[size_array];
    this.size_heap = 0;
  }

  
  //Constructor para pruebas
  public Heap(int[] arreglo, int size_array, int size_heap) {
    this.arreglo = arreglo;
    this.size_array = size_array;
    this.size_heap = size_heap;
  }



  public int[] getArreglo() {
    return arreglo;
  }

  public int getSize_array() {
    return size_array;
  }

  public int getSize_heap() {
    return size_heap;
  }
  
  public int getFather(int i) throws IndexOutOfBoundsException{
    if(i>=1){
      return this.arreglo[i/2-1]; //División entera
    }
    else{
      throw new IndexOutOfBoundsException();
    }
  }

  public int getLeft(int i) throws IndexOutOfBoundsException{
    int izq = 2*i;
    if(izq <= this.size_heap){
      return this.arreglo[izq-1];
    }
    else{
      throw new IndexOutOfBoundsException();     
    }
  }

  public int getRight(int i){
    int right = 2*i+1;
    if(right <= this.size_heap){
      return this.arreglo[right-1];
    }
    else{
      throw new IndexOutOfBoundsException();     
    }    
  }
  /**
   * Función para heapify
   * @param i que la posición del arbol que deseo ajustar
   */
  public void Heapify(int i) throws OperationNotSupportedException{
    int left = 2*i;
    int right = 2*i+1;
    int aux = arreglo[i-1];
    
    if(left <= this.size_heap && right <= this.size_heap){
      if(this.getLeft(i) > this.getRight(i) && this.getLeft(i)>this.arreglo[i-1]){
        this.arreglo[i-1] = arreglo[left-1];
        this.arreglo[left-1] = aux;
        this.Heapify(left);
      }
      else{
        if(this.getRight(i)>this.arreglo[i-1]){
          this.arreglo[i-1] = arreglo[right-1];
          this.arreglo[right-1] = aux;
          this.Heapify(right);   
        }    
      }
    }
    else{
      if(left <= this.size_heap && this.getLeft(i)>this.arreglo[i-1]){
        this.arreglo[i-1] = arreglo[left-1];
        this.arreglo[left-1] = aux;
        this.Heapify(left);             
      }
    }
  }
  
  public void buildHeap() throws OperationNotSupportedException{
    for(int i=this.size_heap/2; i>=1; i--){
      this.Heapify(i);
    }
  }

  public void heapSort() throws OperationNotSupportedException{
    this.buildHeap();
    while(this.size_heap > 0){
      this.Heapify(1);
      int aux = this.arreglo[0];
      this.arreglo[0] = this.arreglo[this.size_heap-1];
      this.arreglo[this.size_heap-1] = aux;
      this.size_heap--;
    }
  }
}
