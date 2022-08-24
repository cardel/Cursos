public class MainTree3 {
    public static void main(String[] args) {

        Tree3 objTree = new Tree3(
                "a",
                new Tree3(
                        "b",
                        new Tree3("d",
                                new Tree3("j", null, null, null),
                                new Tree3("k", null, null, null),
                                null),
                        new Tree3("e", null, null, null),
                        null),
                new Tree3(
                        "c",
                        new Tree3("f", null, null, null),
                        new Tree3("g", null, null, null),
                        null),
                new Tree3("b",
                        new Tree3("h", null, null, null),
                        new Tree3("i",
                                new Tree3("m", null, null, null),
                                null, null),
                        null));

        System.out.println(objTree.preorder());
        System.out.println(objTree.inorder());
        System.out.println(objTree.posorder());
    }
}
