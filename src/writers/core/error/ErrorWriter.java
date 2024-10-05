package writers.core.error;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class ErrorWriter {

    public static void createErrorFiles(Path path, String projectName) throws IOException {
        String errorClassName = getErrorClassName(projectName);
        createErrorClass(path, errorClassName);
        createErrorHandler(path, errorClassName);
        createExportFile(path);
    }

    private static  String getErrorClassName(String projectName)
    {
        String[] splits = projectName.split("_");
        StringBuilder builder = new StringBuilder();
        for(String split : splits) {
            builder.append(split.toUpperCase().charAt(0));
            builder.append(split.toLowerCase().substring(1));
        }
        builder.append("Error");
        return builder.toString();
    }

    private static void createErrorClass(Path path, String errorClassName) throws IOException {
        String content = "class " + errorClassName + " extends Error {\n" +
                "  final String message;\n" +
                "\n" +
                "  " + errorClassName + "({\n" +
                "    required this.message,\n" +
                "  });\n" +
                "}\n";


        Path filePath = Paths.get(path.toString(), "error.dart");
        Files.writeString(Files.createFile(filePath), content);
    }

    private static void createErrorHandler(Path path, String errorClassName) throws IOException {
        String content = "import 'package:dio/dio.dart';\n" +
                "import 'error.dart';\n" +
                "\n" +
                errorClassName + " determineDioError(DioException e) {\n" +
                "  switch (e.type) {\n" +
                "    case DioExceptionType.badResponse:\n" +
                "      return " + errorClassName + "(message: e.response?.data[\"message\"]);\n" +
                "    case DioExceptionType.connectionError:\n" +
                "      return "+ errorClassName + "(\n" +
                "        message: \"Unable to connect. Please check your internet connection\",\n" +
                "      );\n" +
                "    case DioExceptionType.connectionTimeout:\n" +
                "    case DioExceptionType.sendTimeout:\n" +
                "    case DioExceptionType.receiveTimeout:\n" +
                "      return " + errorClassName + "(\n" +
                "        message: \"Request timeout. Please try again\",\n" +
                "      );\n" +
                "    case DioExceptionType.badCertificate:\n" +
                "      return " + errorClassName + "(\n" +
                "        message: \"Bad certificate.\",\n" +
                "      );\n" +
                "    case DioExceptionType.cancel:\n" +
                "      return " + errorClassName + "(\n" +
                "        message: \"Request canceled. Please try again\",\n" +
                "      );\n" +
                "    case DioExceptionType.unknown:\n" +
                "      return " + errorClassName + "(\n" +
                "        message: \"An unknown error occurred. Please try again.\",\n" +
                "      );\n" +
                "  }\n" +
                "}";


        Path filePath = Paths.get(path.toString(), "handler.dart");
        Files.writeString(Files.createFile(filePath), content);
    }

    private static void createExportFile(Path path) throws  IOException {
        String content = "export 'handler.dart';\n" +
                "export 'error.dart';";
        Path filePath = Paths.get(path.toString(), "errors.dart");
        Files.writeString(Files.createFile(filePath), content);
    }
}
