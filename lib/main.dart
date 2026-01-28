import 'package:flutter/material.dart';
import 'package:garfly/core/theme/app_theme.dart';
import 'package:garfly/features/login/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('es_ES', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Garfly",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.garflyTheme,
      // 1. Define los delegados (los traductores)
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // 2. Define qué idiomas soportas
      supportedLocales: const [
        Locale('es', 'ES'), // Español
        Locale('en', 'US'), // Inglés
      ],
      home: const LoginScreen(),
    );
  }
}
