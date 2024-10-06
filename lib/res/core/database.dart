String get databaseHandlerContent => """
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHandler {
  static Future<void> init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Isar isar = await Isar.open(
      [],
      directory: dir.path,
    );
    GetIt.I.registerSingleton<Isar>(isar);
  }

  static Future<void> clearDatabase() async {
    Isar isar = GetIt.I.get();
    isar.clear();
  }
}
""";