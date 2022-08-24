class TAD{
    int valor;
    public TAD(int n){
        valor = n;
    }

    public void add1(){
        valor++;
    }

    public void dec1(){
        valor--;
    }

    public boolean iszero(){
        return (valor==0) ? true : false;
    }

    public int getValor(){
        return this.valor;
    }
}