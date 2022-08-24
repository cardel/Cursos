public class MainArbol {
    public static void main(String[] args){
        Arbol obj = new Arbol(
            "a",
            new Arbol("b",
                new Arbol("d",null,null),
                new Arbol("e",null,null)
            ),
            new Arbol("c",
                new Arbol("f",null,null),
                new Arbol("g",
                    new Arbol("k",null,null),
                    null
                )
            )  
        );

        System.out.println(obj.getLeft().getKey());
    }
}
