import java.util.LinkedList;

public class ArbolBB {
    private String value;
    private ArbolBB left;
    private ArbolBB right;
    public ArbolBB(String value, ArbolBB left, ArbolBB right) {
        this.value = value;
        this.left = left;
        this.right = right;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public ArbolBB getLeft() {
        return left;
    }

    public void setLeft(ArbolBB left) {
        this.left = left;
    }

    public ArbolBB getRight() {
        return right;
    }

    public void setRight(ArbolBB right) {
        this.right = right;
    }

    public void insert(String value) {

        if (this.value.compareTo(value) >= 0) {
            if (this.left != null) {
                this.left.insert(value);
            } else {
                this.left = new ArbolBB(value, null, null);
            }
        } else {
            if (this.right != null) {
                this.right.insert(value);
            } else {
                this.right = new ArbolBB(value, null, null);
            }

        }

    }

    public LinkedList<String> inorder() {
        LinkedList<String> list = new LinkedList<String>();

        if (this.left != null) {
            LinkedList<String> left = this.left.inorder();
            list.addAll(left);
        }
        list.add(this.value);

        if (this.right != null) {
            LinkedList<String> right = this.right.inorder();
            list.addAll(right);
        }

        return list;
    }

    public String getMinimumValue() {
        if (this.left != null) {
            return this.left.getMinimumValue();
        } else {
            return this.value;
        }
    }

    public String getMaximumValue() {
        if (this.right != null) {
            return this.right.getMaximumValue();
        } else {
            return this.value;
        }
    }

    public boolean search(String value) {
        if (this.value.compareTo(value) == 0) {
            return true;
        } else {
            if (this.value.compareTo(value) < 0) {
                if (this.right != null) {
                    return this.right.search(value);
                } else {
                    return false;
                }
            } else {
                if (this.left != null) {
                    return this.left.search(value);
                } else {
                    return false;
                }
            }
        }
    }

}
