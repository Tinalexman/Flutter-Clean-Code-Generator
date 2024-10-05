package writers.core.providers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class ProviderWriters {

    public static void createProviders(Path path) throws IOException {

        String content = "import 'package:flutter_riverpod/flutter_riverpod.dart';";

        Path filePath = Paths.get(path.toString(), "providers.dart");
        Files.writeString(Files.createFile(filePath), content);
    }
}
