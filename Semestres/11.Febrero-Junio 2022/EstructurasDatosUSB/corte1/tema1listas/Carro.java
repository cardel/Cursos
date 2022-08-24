public class Carro {
    private int modelo;
    private String color;
    private String serie;
    private String marca;

    public Carro(int modelo, String color, String serie, String marca){
        this.modelo = modelo;
        this.color = color;
        this.serie = serie;
        this.marca = marca;
    }

    public int getModelo(){
        return this.modelo;
    } 
    public void setModelo(int modelo){
        this.modelo = modelo;
    }

    public String getColor(){
        return this.color;
    }

    public void setColor(String color){
        this.color = color;
    }

    public String getMarca(){
        return this.marca;
    }

    public void setMarca(String marca){
        this.marca = marca;
    }

    public String getSerie(){
        return this.serie;
    }
    public void setSerie(String serie){
        this.serie  = serie;
    }
}
