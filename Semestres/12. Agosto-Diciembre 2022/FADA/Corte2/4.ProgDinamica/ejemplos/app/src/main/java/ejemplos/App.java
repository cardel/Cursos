/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package ejemplos;

public class App {
    public String getGreeting() {
        return "Hello World!";

    }

    public static void main(String[] args) {
        MultMatDina objDina = new MultMatDina();
        objDina.algoritmoMultiplicacion(new int[]{30,35,15,5,10,20,25}, 6);
        System.out.println(new App().getGreeting());
        
        LCS objLCS = new LCS();
        objLCS.solveLCS("ABCBDAB","BDCABA");
        objLCS.solveLCS("AFCEA","CFEHA");

    }
}
