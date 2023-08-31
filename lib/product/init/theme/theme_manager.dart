import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:news_app/core/init/theme/i_theme_manager.dart';

@Singleton(as: IThemeManager)
class ThemeManager extends IThemeManager {

  @override
  ThemeData get defaultTheme {
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
  
  @override
  ThemeData get darkTheme => throw UnimplementedError();
}
