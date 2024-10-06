import 'package:flutter/material.dart';


extension BuildExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ScaffoldMessengerState get snackBar => ScaffoldMessenger.of(this);
}