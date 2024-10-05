import java.util.Scanner;

public class Input {
    private static final Scanner scanner;

    static {
        scanner = new Scanner(System.in);
    }


    public static String readLine() {
        return scanner.nextLine();
    }

    public static String readChar() {
        return scanner.next();
    }
}
