import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class LanguageManager {
  String get path => 'assets/translations';

  final enLocale = const Locale('en', 'US');

  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
