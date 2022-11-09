import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;

  static LanguageManager get instance => _instance ??= LanguageManager._internal();

  String get path => 'assets/translations';

  LanguageManager._internal();

  final enLocale = const Locale('en', 'US');

  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
