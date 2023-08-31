import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:news_app/core/constants/app/application_constants.dart';
import 'package:news_app/core/init/navigation/i_navigation_service.dart';
import 'package:news_app/core/init/theme/i_theme_manager.dart';
import 'package:news_app/product/init/language/language_manager.dart';
import 'package:news_app/product/init/provider/application_provider.dart';
import 'package:news_app/product/init/startup/startup_manager.dart';
import 'package:news_app/product/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StartupManager.initialize();

  runApp(
    EasyLocalization(
      path: getIt<LanguageManager>().path,
      supportedLocales: getIt<LanguageManager>().supportedLocales,
      fallbackLocale: getIt<LanguageManager>().enLocale,
      child: MultiProvider(
        providers: ApplicationProvider.uiChangesItems,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: ApplicationConstants.APP_NAME,
      theme: getIt<IThemeManager>().defaultTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      routerDelegate: getIt<INavigationService>().routerDelegate(),
      routeInformationParser:
          getIt<INavigationService>().routeInformationParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
