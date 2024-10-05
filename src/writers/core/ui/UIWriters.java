package writers.core.ui;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class UIWriters {

    public static void createColorsAndThemes(Path path) throws IOException {
        createColorsFile(path);
        createThemesFile(path);
        createExportFile(path);
    }

    private static void createColorsFile(Path path) throws IOException {
        String content =
                """
                        import 'package:flutter/material.dart';

                        class AppColors {

                          static Color get primary => const Color(0xFFFF0000);
                          static Color get secondary => const Color(0xFFFFFF00);

                        }""";

        Path filePath = Paths.get(path.toString(), "colors.dart");
        Files.writeString(Files.createFile(filePath), content);
    }


    private static void createThemesFile(Path path) throws IOException {
        String content =
                """
                        import 'package:flex_color_scheme/flex_color_scheme.dart';
                        import 'package:flutter/material.dart';

                        ThemeData lightThemeData = FlexThemeData.light(
                          fontFamily: "Inter", // Replace with your actual font family
                          useMaterial3: true,
                          scheme: FlexScheme.mandyRed,
                          appBarStyle: FlexAppBarStyle.scaffoldBackground,
                          surfaceTint: Colors.transparent,
                          appBarElevation: 1.0,
                        );

                        ThemeData darkThemeData = FlexThemeData.dark(
                          fontFamily: "Inter", // Replace with your actual font family
                          useMaterial3: true,
                          scheme: FlexScheme.mandyRed,
                          appBarStyle: FlexAppBarStyle.scaffoldBackground,
                          surfaceTint: Colors.transparent,
                          appBarElevation: 1.0,
                        );
                        """;

        Path filePath = Paths.get(path.toString(), "themes.dart");
        Files.writeString(Files.createFile(filePath), content);
    }

    private static void createExportFile(Path path) throws IOException {
        String content =
                "export 'colors.dart';\n" +
                        "export 'themes.dart';";

        Path filePath = Paths.get(path.toString(), "ui.dart");
        Files.writeString(Files.createFile(filePath), content);
    }
}
