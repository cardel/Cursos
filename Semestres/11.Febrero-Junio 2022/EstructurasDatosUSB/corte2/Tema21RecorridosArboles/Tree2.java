import java.util.LinkedList;
import java.util.Arrays;

public class Tree2 {
    private int key;
    private Tree2 left;
    private Tree2 right;

    
    public Tree2(int key, Tree2 left, Tree2 right) {
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



    public Tree2 getLeft() {
        return left;
    }



    public void setLeft(Tree2 left) {
        this.left = left;
    }



    public Tree2 getRight() {
        return right;
    }



    public void setRight(Tree2 right) {
        this.right = right;
    }



    public LinkedList<Integer> preorder(){
        LinkedList<Integer> list = new LinkedList<Integer>();
        list.add(this.key);
        if(this.left!=null) list.addAll(this.left.preorder());
        if(this.right!=null)list.addAll(this.right.preorder());
        return list;
    }

    public LinkedList<Integer> inorder(){
        LinkedList<Integer> list = new LinkedList<Integer>();
        if(this.left!=null) list.addAll(this.left.inorder());
        list.add(this.key);
        if(this.right!=null)list.addAll(this.right.inorder());
        return list;
    }

    public LinkedList<Integer> posorder(){
        LinkedList<Integer> list = new LinkedList<Integer>();

        if(this.left!=null) list.addAll(this.left.posorder());
        if(this.right!=null)list.addAll(this.right.posorder());
        list.add(this.key);
        return list;
    }
}
