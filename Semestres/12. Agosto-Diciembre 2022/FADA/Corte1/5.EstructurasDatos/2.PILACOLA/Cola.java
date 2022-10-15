public class Cola {
  int head;
  int tail;
  int size_max;
  int size;
  int arreglo[];

  Cola(int n){
    this.head = 1;
    this.size_max = n;
    this.size = 0;
    this.tail = 1;
    this.arreglo = new int[n]; 
  }

  public void enqueue(int n) throws IndexOutOfBoundsException{
    if (this.size_max == size){
      throw new IndexOutOfBoundsException();
    }
    else{
      this.size++;
      arreglo[this.tail-1] = n;
      this.tail = (this.tail>=this.size_max) ? 1 : this.tail+1;
    }
  }

  public int dequeue() throws IndexOutOfBoundsException{
    if (this.size == 0){
      throw new IndexOutOfBoundsException();
    }
    else{
      this.size--;
      int val = arreglo[this.head-1];
      this.head = (this.head>=this.size_max) ? 1 : this.head+1;
      return val;
      
    }
  }
}
