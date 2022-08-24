import java.util.Scanner;
import java.io.File;
import java.util.StringTokenizer;
public class lecturaarchivos {

    public static void main(String[] args) {
        try {
            File archive = new File("libros.txt");
            Scanner scanner = new Scanner(archive);

            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();

                StringTokenizer token = new StringTokenizer(line,",");
                int codigo = Integer.parseInt(token.nextToken());
                String titulo =token.nextToken();
                String autor = token.nextToken();
                int anhio = Integer.parseInt(token.nextToken());
                int num_ejemplares = Integer.parseInt(token.nextToken());

                System.out.println(num_ejemplares);

            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
}