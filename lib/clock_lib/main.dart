import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home_page.dart';
import 'l10n/l10n.dart';
import 'settings/settings.dart';


class AppClock extends StatelessWidget {
  const AppClock({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.watch<SettingsCubit>();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock Game',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      locale: Locale(settingsCubit.state.selectedLanguage ?? 'en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
