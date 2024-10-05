package writers.core.file;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileWriters {
    public static void createFile(Path path) throws IOException {
        createFileImplementation(path);
    }

    private static void createFileImplementation(Path path) throws IOException {
        String content =
                """
                        import 'dart:convert';
                        import 'dart:io';
                        import 'dart:typed_data';

                        import 'package:file_picker/file_picker.dart';
                        import 'package:shared_preferences/shared_preferences.dart';

                        export 'package:file_picker/file_picker.dart' show FileType;

                        class FileHandler {
                          static const String _authenticationEmailKey = "teacherBankEmail";
                          static const String _authenticationPasswordKey = "teacherBankPassword";

                          static Future<bool> get hasAuthDetails async {
                            var result = await loadAuthDetails();
                            return result != null;
                          }

                          static Future<void> saveAuthDetails(Map<String, String>? auth) async {
                            SharedPreferences instance = await SharedPreferences.getInstance();
                            await instance.setString(
                                _authenticationEmailKey, auth == null ? "" : auth["email"]!);
                            await instance.setString(
                                _authenticationPasswordKey, auth == null ? "" : auth["password"]!);
                          }

                          static Future<Map<String, String>?> loadAuthDetails() async {
                            SharedPreferences instance = await SharedPreferences.getInstance();
                            String? email = instance.getString(_authenticationEmailKey);
                            String? password = instance.getString(_authenticationPasswordKey);

                            if (email == null ||
                                password == null ||
                                email.isEmpty ||
                                password.isEmpty) {
                              return null;
                            }
                            return {"email": email, "password": password};
                          }

                          static Future<void> saveString(String key, String value) async {
                            SharedPreferences instance = await SharedPreferences.getInstance();
                            await instance.setString(key, value);
                          }

                          static Future<String?> loadString(String key) async {
                            SharedPreferences instance = await SharedPreferences.getInstance();
                            String? value = instance.getString(key);
                            return value;
                          }

                          static Future<void> saveInt(String key, int value) async {
                            SharedPreferences instance = await SharedPreferences.getInstance();
                            await instance.setInt(key, value);
                          }

                          static Future<int?> loadInt(String key) async {
                            SharedPreferences instance = await SharedPreferences.getInstance();
                            int? value = instance.getInt(key);
                            return value;
                          }

                          static Future<Uint8List> convertFilePathToUint8List(String path) async =>
                              File(path).readAsBytes();

                          static Future<List<Uint8List>> convertFilePathsToListOfUint8List(
                              List<String> paths) async {
                            List<Uint8List> listOfByteData = [];
                            for (var path in paths) {
                              Uint8List byteData = await convertFilePathToUint8List(path);
                              listOfByteData.add(byteData);
                            }
                            return listOfByteData;
                          }

                          static List<Uint8List> decodeBase64StringsToListOfUint8List(
                              List<String> encodedData) {
                            List<Uint8List> listOfByteData = [];
                            for (var data in encodedData) {
                              listOfByteData.add(base64.decode(data));
                            }
                            return listOfByteData;
                          }

                          static Future<String> convertFilePathToBase64String(String path) async {
                            Uint8List data = await convertFilePathToUint8List(path);
                            return convertUint8ListToBase64String(data);
                          }

                          static String convertUint8ListToBase64String(Uint8List data) =>
                              base64.encode(data);

                          static Future<FileResponse?> selectSingleFile({
                            List<String> extensions = const [],
                            FileType type = FileType.custom,
                          }) async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              allowedExtensions: type == FileType.custom ? extensions : null,
                              type: type,
                              allowMultiple: false,
                            );
                            if (result != null) {
                              return _convertPlatformFileToFileResponse(result.files.single);
                            }
                            return null;
                          }

                          static Future<List<FileResponse>?> selectMultipleFiles({
                            List<String> extensions = const [],
                            FileType type = FileType.custom,
                          }) async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              allowedExtensions: type == FileType.custom ? extensions : null,
                              type: type,
                              allowMultiple: true,
                            );

                            if (result != null) {
                              List<FileResponse> response = [];
                              List<PlatformFile> files = result.files;
                              for (PlatformFile file in files) {
                                response.add(await _convertPlatformFileToFileResponse(file));
                              }
                              return response;
                            }

                            return null;
                          }

                          static Future<FileResponse> _convertPlatformFileToFileResponse(
                              PlatformFile file) async {
                            Uint8List data = await convertFilePathToUint8List(file.path!);

                            return FileResponse(
                              path: file.path!,
                              extension: file.extension!,
                              filename: file.name,
                              size: file.size,
                              data: data,
                            );
                          }
                        }

                        class FileResponse {
                          String path;
                          String filename;
                          String extension;
                          int size;
                          Uint8List data;

                          FileResponse({
                            this.path = "",
                            this.filename = "",
                            this.extension = "",
                            this.size = 0,
                            required this.data,
                          });

                          @override
                          String toString() =>
                              "{name: $filename, path: $path, extension: $extension, size: $size}";
                        }
                        """;

        Path filePath = Paths.get(path.toString(), "file_handler.dart");
        Files.writeString(Files.createFile(filePath), content);
    }
}
