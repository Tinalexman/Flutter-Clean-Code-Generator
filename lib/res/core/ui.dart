String get colorsContent {
  return """
    import 'package:flutter/material.dart';
    
    class AppColors {
    
      static Color get primary => const Color(0xFFFF0000);
      static Color get secondary => const Color(0xFFFFFF00);
    
    }
""";
}

String get themeContent {
  return """
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
}

String get uiExport {
  return """
    export 'colors.dart';
    export 'themes.dart';
    """;
}
