

public class Display {

    public static final String RESET = "\033[0m";
    public static final String RED = "\033[0;31m";
    public static final String GREEN = "\033[0;32m";
    public static final String YELLOW = "\033[0;33m";
    public static final String BLUE = "\033[0;34m";
    public static final String PURPLE = "\033[0;35m";
    public static final String CYAN = "\033[0;36m";

    public static void displayIntroMessage() {
        System.out.println();
        System.out.println(YELLOW + "*****************************************" + RESET);
        System.out.println(BLUE + "Welcome to Flutter Clean Code Tool" + RESET);
        System.out.println(YELLOW + "*****************************************" + RESET);
        System.out.println();
    }

    public static void displayOutroMessage() {
        System.out.println();
        System.out.println(PURPLE + "*******************************************************" + RESET);
        System.out.println(CYAN + "Your project is now squeaky clean :) Good Luck!" + RESET);
        System.out.println(PURPLE + "*******************************************************" + RESET);
        System.out.println();
    }

    public static void displayMessage(String message) {
        System.out.println(GREEN + message + RESET);
    }

    public static void displayInputMessage(String message) {
        System.out.println();
        System.out.print(RED + message + ": " + RESET);
    }
}
