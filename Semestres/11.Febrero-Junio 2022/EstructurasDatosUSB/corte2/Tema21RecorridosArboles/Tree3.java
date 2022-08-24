import java.util.LinkedList;
import java.util.Arrays;

public class Tree3 {
    private String key;
    private Tree3 left;
    private Tree3 right1;
    private Tree3 right2;
    public Tree3(String key, Tree3 left, Tree3 right1, Tree3 right2) {
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
    public Tree3 getLeft() {
        return left;
    }
    public void setLeft(Tree3 left) {
        this.left = left;
    }
    public Tree3 getRight1() {
        return right1;
    }
    public void setRight1(Tree3 right1) {
        this.right1 = right1;
    }
    public Tree3 getRight2() {
        return right2;
    }
    public void setRight2(Tree3 right2) {
        this.right2 = right2;
    }

    public LinkedList<String> preorder(){
        LinkedList<String> list = new LinkedList<String>();
        list.add(this.key);
        if(this.left!=null) list.addAll(this.left.preorder());
        if(this.right1!=null)list.addAll(this.right1.preorder());
        if(this.right2!=null)list.addAll(this.right2.preorder());
        return list;
    }

    public LinkedList<String> inorder(){
        LinkedList<String> list = new LinkedList<String>();
        if(this.left!=null) list.addAll(this.left.inorder());
        list.add(this.key);
        if(this.right1!=null)list.addAll(this.right1.inorder());
        if(this.right2!=null)list.addAll(this.right2.inorder());
        return list;
    }

    public LinkedList<String> posorder(){
        LinkedList<String> list = new LinkedList<String>();

        if(this.left!=null) list.addAll(this.left.posorder());
        if(this.right1!=null)list.addAll(this.right1.posorder());
        if(this.right2!=null)list.addAll(this.right2.posorder());
        list.add(this.key);
        return list;
    }
}
