package writers.core.extensions;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class ExtensionWriters {
    public static void createExtensionFiles(Path path) throws IOException {
        createContextExtension(path);
        createStringExtension(path);
        createDateTimeExtension(path);
        createExportFile(path);
    }

    private static void createContextExtension(Path path) throws IOException {
        String content =
                """
                        import 'package:flutter/material.dart';
                        import 'package:go_router/go_router.dart';

                        extension BuildContextExtension on BuildContext {
                          GoRouter get router => GoRouter.of(this);
                          TextTheme get textTheme => Theme.of(this).textTheme;
                          bool get isDark => MediaQuery.of(this).platformBrightness == Brightness.dark;
                        }""";

        Path filePath = Paths.get(path.toString(), "build_context.dart");
        Files.writeString(Files.createFile(filePath), content);
    }

    private static void createDateTimeExtension(Path path) throws IOException {
        String content = """
                extension DateTimeExtensions on DateTime {
                  DateTime get startOfWeek =>
                      DateTime(year, month, day - weekday + 1);

                  DateTime get endOfWeek =>
                      DateTime(year, month, day + (7 - weekday));

                  DateTime get startOfMonth => DateTime(year, month, 1);

                  DateTime get endOfMonth => DateTime(year, month + 1, 0);
                }""";

        Path filePath = Paths.get(path.toString(), "date_time.dart");
        Files.writeString(Files.createFile(filePath), content);
    }

    private static void createStringExtension(Path path) throws IOException {
        String content = "extension PathExtension on String {\n" +
                "  String get path => \"/$this\";\n" +
                "}";

        Path filePath = Paths.get(path.toString(), "string.dart");
        Files.writeString(Files.createFile(filePath), content);
    }

    private static void createExportFile(Path path) throws IOException {
        String content =
                "export 'build_context.dart';\n" +
                        "export 'string.dart';\n" +
                        "export 'date_time.dart';";

        Path filePath = Paths.get(path.toString(), "extensions.dart");
        Files.writeString(Files.createFile(filePath), content);
    }
}
