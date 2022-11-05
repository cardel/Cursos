import javax.naming.OperationNotSupportedException;

public class bst {
  private bst left;
  private bst right;
  private int value;
  private bst father;

  public bst(bst left, bst right, int value, bst father) {
    this.left = left;
    this.right = right;
    this.value = value;
    this.father = father;
  }

  public bst getLeft() {
    return left;
  }

  public void setLeft(bst left) {
    this.left = left;
  }

  public bst getRight() {
    return right;
  }

  public void setRight(bst right) {
    this.right = right;
  }

  public int getValue() {
    return value;
  }

  public void setValue(int value) {
    this.value = value;
  }

  public bst getFather() {
    return father;
  }

  public void setFather(bst father) {
    this.father = father;
  }

  public void insert(int value) throws OperationNotSupportedException {
    if (value >= this.value) {
      if (this.right == null) {
        this.right = new bst(null, null, value, this);
      } else {
        this.right.insert(value);
      }
    } else {
      if (this.left == null) {
        this.left = new bst(null, null, value, this);
      } else {
        this.left.insert(value);
      }
    }
  }

  public bst search(int value) throws NullPointerException {
    if (this.value == value) {
      return this;
    } else {
      if (value >= this.value) {
        if (this.getRight() != null) {
          return this.getRight().search(value);
        } else {
          throw new NullPointerException();
        }
      } else {
        if (this.getLeft() != null) {
          return this.getLeft().search(value);
        } else {
          throw new NullPointerException();
        }
      }
    }
  }

  public bst minimmum() throws OperationNotSupportedException {
    if (this.getLeft() != null) {
      return this.getLeft().minimmum();
    } else {
      return this;
    }
  }

  public bst maximmum() throws OperationNotSupportedException {
    if (this.getRight() != null) {
      return this.getRight().maximmum();
    } else {
      return this;
    }
  }

  public bst successor(int value) throws NullPointerException, OperationNotSupportedException {
    bst currentNode = this.search(value);
    if (currentNode.getRight() != null) {
      return currentNode.getRight().minimmum();
    } else {
      bst y = currentNode.getFather();
      while (y != null && currentNode == y.getRight()) {
        currentNode = y;
        y = y.getFather();
      }

      if (y == null) {
        throw new NullPointerException();
      } else {
        return y;
      }
    }

  }

  public void delete(int value) throws OperationNotSupportedException {

    bst currentNode = this.search(value);
    bst father = currentNode.getFather();

    // Caso 1
    if (currentNode.getLeft() == null && currentNode.getRight() == null) {
      if (father != null) {
        if (currentNode == father.getLeft()) {
          father.setLeft(null);
        } else {
          father.setRight(null);
        }
      } else {
        throw new OperationNotSupportedException();
      }
    } else {
      // Caso 2
      if (currentNode.getLeft() == null || currentNode.getRight() == null) {

        bst child = currentNode.getLeft() != null ? currentNode.getLeft() : currentNode.getRight();
        if (currentNode == father.getLeft()) {
          father.setLeft(child);
        } else {
          father.setRight(child);
        }
      }
      // Caso 3
      else {
        bst succ = currentNode.successor(currentNode.getValue());
        currentNode = succ;
        if (father != null) {
          if (currentNode == father.getLeft()) {
            father.setLeft(succ);
          } else {
            father.setRight(succ);
          }
        }

        currentNode.getLeft().setFather(succ);
        currentNode.getRight().setFather(succ);
        //this.delete(succ.getValue()); /// Borro el succ
      }
    }

  }

  public String inorder() {
    String izq = "";
    String raiz = "";
    String der = "";
    if (this.left != null) {
      izq = this.left.inorder() + " ";
    }
    if (this.right != null) {
      der = " " + this.right.inorder();
    }
    raiz = String.valueOf(this.value);
    return izq + raiz + der;

  }

}
