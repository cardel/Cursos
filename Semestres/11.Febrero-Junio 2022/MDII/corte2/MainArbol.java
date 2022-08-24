public class MainArbol {

    public static void main(String[] args) {
        Arbol arbolObj = new Arbol(
                1,
                new Arbol(
                        2,
                        new Arbol(4, null, null),
                        new Arbol(5, null, null)),
                new Arbol(3,
                        new Arbol(6, null, null),
                        new Arbol(7, null, null)));

        System.out.println(arbolObj);

        Arbol arbolObj2 = new Arbol(
                1,
                new Arbol(
                        7,
                        new Arbol(2, null, null),
                        new Arbol(
                                6,
                                new Arbol(5, null, null),
                                new Arbol(11, null, null))),
                new Arbol(
                        9,
                        null,
                        new Arbol(
                                9,
                                new Arbol(5, null, null),
                                null)));

        System.out.println(arbolObj2.preorder());
        System.out.println(arbolObj2.inorder());
        System.out.println(arbolObj2.posorder());
    }

}
