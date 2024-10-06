String get contextExtension {
  return """
    import 'package:flutter/material.dart';
    import 'package:go_router/go_router.dart';

    extension BuildContextExtension on BuildContext {
      GoRouter get router => GoRouter.of(this);
      TextTheme get textTheme => Theme.of(this).textTheme;
      bool get isDark => MediaQuery.of(this).platformBrightness == Brightness.dark;
    }
    """;
}

String get dateTimeExtension {
  return """
    extension DateTimeExtensions on DateTime {
      DateTime get startOfWeek => DateTime(year, month, day - weekday + 1);
      
      DateTime get endOfWeek => DateTime(year, month, day + (7 - weekday));

      DateTime get startOfMonth => DateTime(year, month, 1);

      DateTime get endOfMonth => DateTime(year, month + 1, 0);
    }
    """;
}

String get stringExtension {
  return
    """
     extension PathExtension on String {
      String get path => "/\$this";
     }
    """;
}

String get extensionExport {
  return """
    export 'build_context.dart';
    export 'string.dart';
    export 'date_time.dart';
    """;
}
