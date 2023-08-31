import 'package:flutter/material.dart';

abstract class IThemeManager {
  ThemeData get defaultTheme;
  ThemeData get darkTheme;
}
