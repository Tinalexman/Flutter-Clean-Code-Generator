package writers.core.network;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class NetworkWriters {


    public static void createNetworkConfiguration(Path path) throws IOException {

        String content = """
                import 'package:dio/dio.dart';
                export 'package:dio/dio.dart';
                 
                const String baseUrl = "";
                const String accessToken = "";
                 
                final Dio dio = Dio(
                   BaseOptions(
                     baseUrl: baseUrl,
                     connectTimeout: const Duration(seconds: 30),
                     sendTimeout: const Duration(seconds: 60),
                     receiveTimeout: const Duration(seconds: 60),
                   ),
                );
                 """;

        Path filePath = Paths.get(path.toString(), "configuration.dart");
        Files.writeString(Files.createFile(filePath), content);
    }
}
