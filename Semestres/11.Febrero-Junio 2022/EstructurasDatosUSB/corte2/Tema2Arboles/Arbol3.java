public class Arbol3 {
    private String key;
    private Arbol3 left;
    private Arbol3 right1;
    private Arbol3 right2;
    Arbol3(String key,Arbol3 left,Arbol3 right1,Arbol3 right2) {
        this.key = key;
        this.left = left;
        this.right1 = right1;
        this.right2 = right2;
    }
    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }
    public Arbol3 getLeft() {
        return left;
    }
    public void setLeft(Arbol3 left) {
        this.left = left;
    }
    public Arbol3 getRight1() {
        return right1;
    }
    public void setRight1(Arbol3 right1) {
        this.right1 = right1;
    }
    public Arbol3 getRight2() {
        return right2;
    }
    public void setRight2(Arbol3 right2) {
        this.right2 = right2;
    }

    
}
