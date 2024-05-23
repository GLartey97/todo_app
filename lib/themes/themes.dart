import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: const Color(0xff8780dd),
    primary: Colors.grey.shade100,
    secondary: Colors.grey.shade500,
    tertiary: Colors.grey.shade200,
    inversePrimary: Colors.grey.shade900,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color(0xff5a4a9e),
    primary: Colors.grey.shade900,
    secondary: Colors.grey.shade600,
    tertiary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade100,
  ),
);
