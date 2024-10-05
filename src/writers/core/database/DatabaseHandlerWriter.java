package writers.core.database;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


public class DatabaseHandlerWriter {


    public static void createHandlerFile(Path path) throws IOException {

        String content = """
                import 'dart:io';
                import 'package:get_it/get_it.dart';
                import 'package:isar/isar.dart';
                import 'package:path_provider/path_provider.dart';
                 \s
                 \s
                class DatabaseHandler {
                    static Future<void> init() async {
                      Directory dir = await getApplicationDocumentsDirectory();
                      Isar isar = await Isar.open(
                        [],
                        directory: dir.path,
                      );
                      GetIt.I.registerSingleton<Isar>(isar);
                    }
                 \s
                    static Future<void> clearDatabase() async {
                      Isar isar = GetIt.I.get();
                      isar.clear();
                    }
                }
                 \s""";


        Path filePath = Paths.get(path.toString(), "configuration.dart");
        Files.writeString(Files.createFile(filePath), content);
    }
}
