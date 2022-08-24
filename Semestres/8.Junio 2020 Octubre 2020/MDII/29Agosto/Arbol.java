public class Arbol{

  private char valor;
  private Arbol hizq;
  private Arbol hder1;
  private Arbol hder2;

  public Arbol(char valor, Arbol hizq, Arbol hder1, Arbol hder2){

      this.valor = valor;
      this.hizq = hizq;
      this.hder1 = hder1;
      this.hder2 = hder2;
  }
  
  public char getValor(){
    return this.valor;
  }
  public Arbol getHizq(){

    return this.hizq;
  }

  public Arbol getHder1(){

    return this.hder1;
  }

  public Arbol getHder2(){

    return this.hder2;
  }
}
