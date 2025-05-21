import 'package:burning_bros_interview/core/blocs/theme/theme_bloc.dart';
import 'package:burning_bros_interview/core/configs/app_router.dart';
import 'package:burning_bros_interview/core/di/injector.dart';
import 'package:burning_bros_interview/core/localization/app_localizations.dart';
import 'package:burning_bros_interview/core/themes/theme_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlutterInterviewApp extends StatelessWidget {
  const FlutterInterviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (__) => getIt<ThemeBloc>()..add(InitialThemeEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (__, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Interview',
            themeMode: ThemeMode.system,
            theme:
                (state.isDarkMode)
                    ? ThemeGlobal.darkTheme
                    : ThemeGlobal.lightTheme,
            locale: Locale('vi'),
            supportedLocales: const [Locale('en'), Locale('vi')],
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: AppRoutes.initialRoute,
          );
        },
      ),
    );
  }
}
