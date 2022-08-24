public class MainTree2 {
    public static void main(String[] args) {
        Tree2 objTree = new Tree2(
                1,
                new Tree2(
                        2,
                        new Tree2(4,
                                new Tree2(8, null, null),
                                new Tree2(9, null, null)),
                        new Tree2(
                                5,
                                new Tree2(10, null, null),
                                new Tree2(11, null, null))),
                new Tree2(
                        3,
                        new Tree2(
                                6,
                                new Tree2(13, null, null),
                                null),
                        new Tree2(
                                7,
                                new Tree2(14, null, null),
                                null)));

        System.out.println(objTree.preorder());
        System.out.println(objTree.inorder());
        System.out.println(objTree.posorder());
    }
}
