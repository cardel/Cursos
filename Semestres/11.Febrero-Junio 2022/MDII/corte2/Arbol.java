import java.util.LinkedList;

public class Arbol{
    private int key;
    private Arbol left;
    private Arbol right;
    public Arbol(int key, Arbol left, Arbol right) {
        this.key = key;
        this.left = left;
        this.right = right;
    }
    public int getKey() {
        return key;
    }
    public void setKey(int key) {
        this.key = key;
    }
    public Arbol getLeft() {
        return left;
    }
    public void setLeft(Arbol left) {
        this.left = left;
    }
    public Arbol getRight() {
        return right;
    }
    public void setRight(Arbol right) {
        this.right = right;
    }

    public LinkedList<Integer> preorder(){
        LinkedList<Integer> salida = new LinkedList<Integer>();


        salida.add(this.key);
        if(this.left != null){
            LinkedList<Integer>  salidaL = this.left.preorder();
            for(Integer e:salidaL)
                salida.add(e);
            }


        if(this.right != null){
            LinkedList<Integer> salidaR = this.right.preorder();

            for(Integer e:salidaR){
                salida.add(e);
            }
        }
        return salida;          
    }
    
    public LinkedList<Integer> inorder(){
        LinkedList<Integer> salida = new LinkedList<Integer>();


        if(this.left != null){
            LinkedList<Integer>  salidaL = this.left.inorder();
            for(Integer e:salidaL)
                salida.add(e);
            }

        salida.add(this.key);

        if(this.right != null){
            LinkedList<Integer> salidaR = this.right.inorder();

            for(Integer e:salidaR){
                salida.add(e);
            }
        }
        return salida;          
    }
    public LinkedList<Integer> posorder(){
        LinkedList<Integer> salida = new LinkedList<Integer>();


        if(this.left != null){
            LinkedList<Integer>  salidaL = this.left.posorder();
            for(Integer e:salidaL)
                salida.add(e);
            }



        if(this.right != null){
            LinkedList<Integer> salidaR = this.right.posorder();

            for(Integer e:salidaR){
                salida.add(e);
            }
        }
        salida.add(this.key);
        return salida;          
    }   
}