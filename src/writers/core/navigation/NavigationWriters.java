package writers.core.navigation;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class NavigationWriters
{
    public static void createNavigationPages(Path path) throws IOException {

        String content = """
                class Pages {
                     // e.g static String get splashPage => "splash";
                }""";


        Path filePath = Paths.get(path.toString(), "pages.dart");
        Files.writeString(Files.createFile(filePath), content);
    }
}
