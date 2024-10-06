String _getErrorClassName(String projectName) {
  List<String> splits = projectName.split("_");
  String builder = "";
  for (String split in splits) {
    builder += split.toUpperCase().substring(0, 1);
    builder += split.toLowerCase().substring(1);
  }
  builder += "Error";
  return builder;
}

String errorClass(String projectName) {
  String className = _getErrorClassName(projectName);
  return """
  class $className extends Error {
    final String message;
      
    $className ({
        required this.message,
    });

  }
 """;
}

String errorHandler(String projectName) {
  String className = _getErrorClassName(projectName);
  return """
  import 'package:dio/dio.dart';
  import 'error.dart';

  $className determineDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.badResponse:
        return $className(message: e.response?.data["message"]);
      case DioExceptionType.connectionError:
        return $className(
          message: "Unable to connect. Please check your internet connection",
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return $className(
          message: "Request timeout. Please try again",
        );
      case DioExceptionType.badCertificate:
        return $className(
          message: "Bad certificate.",
        );
      case DioExceptionType.cancel:
        return $className(
          message: "Request canceled. Please try again",
        );
      case DioExceptionType.unknown:
        return $className(
          message: "An unknown error occurred. Please try again.",
        );
    }
  """;
}

String get errorExport {
  return """
    export 'error.dart';
    export 'handler.dart';
    """;
}
