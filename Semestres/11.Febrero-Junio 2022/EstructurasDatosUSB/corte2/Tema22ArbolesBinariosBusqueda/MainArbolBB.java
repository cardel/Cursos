public class MainArbolBB {
    public static void main(String[] args){
        ArbolBB bb = new ArbolBB("ipod touch",null,null);


        bb.insert("ipad");
        System.out.println(bb.inorder());

        bb.insert("playstation");
        System.out.println(bb.inorder());

        bb.insert("apple tv");
        bb.insert("iphone");
        bb.insert("nintendo wii");
        bb.insert("smart tv");
        System.out.println(bb.inorder());
        
        System.out.println(bb.getMaximumValue());
        System.out.println(bb.getMinimumValue());

        System.out.println(bb.search("nintendo wii"));
        System.out.println(bb.search("celular"));

        System.out.println(bb.sucessor("ipod touch"));
        System.out.println(bb.sucessor("apple tv"));
    }

 

}
