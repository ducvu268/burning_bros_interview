import 'package:burning_bros_interview/core/configs/app_router.dart';
import 'package:burning_bros_interview/core/localization/app_localizations.dart';
import 'package:burning_bros_interview/core/themes/theme_global.dart';
import 'package:flutter/material.dart';

class FlutterInterviewApp extends StatelessWidget {
  const FlutterInterviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Interview',
      themeMode: ThemeMode.system,
      theme: ThemeGlobal.lightTheme,
      locale: Locale('vi'),
      supportedLocales: const [Locale('en'), Locale('vi')],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
