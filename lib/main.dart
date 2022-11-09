import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/constants/app/application_constants.dart';
import 'product/init/lang/language_manager.dart';
import 'product/init/navigation/navigation_router.dart';
import 'product/init/navigation/navigation_service.dart';
import 'product/init/startup/startup_manager.dart';
import 'product/init/theme/light_theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StartupManager.instance.initialize();

  runApp(
    EasyLocalization(
      path: LanguageManager.instance.path,
      supportedLocales: LanguageManager.instance.supportedLocales,
      fallbackLocale: LanguageManager.instance.enLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ApplicationConstants.appName,
      theme: ThemeManager.instance.getTheme,
      navigatorKey:  NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRouter.instance.onGenerateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
