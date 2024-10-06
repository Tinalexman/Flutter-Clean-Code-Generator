import 'dart:io';

Future<Directory> createDirectory(String path) async {
  Directory target = Directory(path);
  bool exists = await target.exists();
  if (exists) {
    target.delete(recursive: true);
  }

  await target.create();
  return target;
}

Future<File> createFile(String path) async {
  File target = File(path);
  bool exists = await target.exists();
  if (exists) {
    target.delete(recursive: true);
  }

  await target.create();
  return target;
}

Future<void> writeToFile(String path, String content) async {
  await File(path).writeAsString(content, flush: true);
}