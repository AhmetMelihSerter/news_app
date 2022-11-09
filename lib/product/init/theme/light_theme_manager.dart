import 'package:flutter/material.dart';

import '../../../core/init/theme/i_theme_manager.dart';

class ThemeManager extends IThemeManager {
  static ThemeManager? _instance;

  static ThemeManager get instance => _instance ??= ThemeManager._internal();

  ThemeManager._internal();

  @override
  ThemeData get getTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
    );
  }
}
