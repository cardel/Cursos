import java.util.LinkedList;

import java.lang.UnsupportedOperationException;
import java.lang.NullPointerException;

public class TablasHash {
  private LinkedList<Integer> tabla[];
  private int size;
  
  public int getSize() {
    return size;
  }

  public void setSize(int size) {
    this.size = size;
  }

  public TablasHash(int n) throws Exception{
    this.tabla = new LinkedList[n];
    this.size = n;
  }


  public boolean search(int k, int value) throws Exception{
    int pos = this.hashFunction(k);
    LinkedList found = this.tabla[pos];
    if(found!=null){
      for(Object c: found){
        Integer ci = (Integer)c;
        if(ci==value){
          return true;
        }
      }
    
  }
      
    return false;

  }
  public void insert(int k, int value) throws Exception{
    int pos = this.hashFunction(k);

    LinkedList<Integer> found = this.tabla[pos];
    if (found==null){
      found = new LinkedList<Integer>();
      found.add(value);
      this.tabla[pos] = found;
    }
    else{
      found.add(value);
      this.tabla[pos] = found;
    }
  }


  public void delete(int k, int v) throws Exception{
    int pos = this.hashFunction(k);

    LinkedList<Integer> found = this.tabla[pos];
    
    found.remove((Integer)v);

    this.tabla[pos] = found;

  }

  private int hashFunction(int k) throws Exception{
    
    return k % this.size;

  }
}
