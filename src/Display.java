

public class Display {


    public static void displayIntroMessage() {
        System.out.println();
        System.out.println("*****************************************");
        System.out.println("Welcome to Flutter Clean Code Tool");
        System.out.println("*****************************************");
        System.out.println();
    }

    public static void displayMessage(String message) {
        System.out.println(message);
    }

    public static void displayInputMessage(String message) {
        System.out.print(message + ": ");
    }
}
