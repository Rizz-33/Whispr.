import 'package:flutter/material.dart';
import 'package:whispr/themes/dark.dart';
import 'package:whispr/themes/light.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;
}