public class Arbol4 {
    private int key;
    private Arbol4 left;
    private Arbol4 right1;
    private Arbol4 right2;
    private Arbol4 right3;
    public Arbol4(int key, Arbol4 left, Arbol4 right1, Arbol4 right2, Arbol4 right3) {
        this.key = key;
        this.left = left;
        this.right1 = right1;
        this.right2 = right2;
        this.right3 = right3;
    }
    public int getKey() {
        return key;
    }
    public void setKey(int key) {
        this.key = key;
    }
    public Arbol4 getLeft() {
        return left;
    }
    public void setLeft(Arbol4 left) {
        this.left = left;
    }
    public Arbol4 getRight1() {
        return right1;
    }
    public void setRight1(Arbol4 right1) {
        this.right1 = right1;
    }
    public Arbol4 getRight2() {
        return right2;
    }
    public void setRight2(Arbol4 right2) {
        this.right2 = right2;
    }
    public Arbol4 getRight3() {
        return right3;
    }
    public void setRight3(Arbol4 right3) {
        this.right3 = right3;
    }

    

    

}
