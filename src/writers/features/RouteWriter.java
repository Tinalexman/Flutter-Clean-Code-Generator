package writers.features;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class RouteWriter {

    private static String getProjectImports(String projectName) {
        return  "import 'package:go_route/go_route.dart';\n" +
                "import 'package:" + projectName + "/core/extensions/extensions.dart';\n" +
                "import 'package:" + projectName + "/core/navigation/pages.dart';";
    }

    public static void createRouteFile(String targetPath, String featureName, String projectName) throws IOException {
        String imports = getProjectImports(projectName);
        String content = "final List<GoRoute> " + featureName + "Routes = [" + "\n\t\n];";
        Path filePath = Paths.get(targetPath,  "presentation","routes.dart");
        Files.writeString(Files.createFile(filePath), imports + "\n\n" + content);
    }
}
