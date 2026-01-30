import 'package:flutter/material.dart';
import 'package:garfly/core/theme/app_theme.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:garfly/core/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:garfly/features/login/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/di/injection_container.dart' as dependencyInjections;

void main() async {
  // 1. Línea obligatoria cuando el main es async
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('es_ES', null);

  await dependencyInjections.init();

  final preferences = await SharedPreferences.getInstance();
  final String? userName = preferences.getString('user_name');
  final initialRoute = userName == null ? '/login' : '/main';
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Garfly",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.garflyTheme,
      initialRoute: initialRoute,
      routes: {
        "/login": (context) => const LoginScreen(),
        "/main": (context) => const MainScreen(),
      },
      // 1. Define los delegados (los traductores)
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // 2. Define qué idiomas soportas
      supportedLocales: const [Locale('es', 'ES'), Locale('en', 'US')],
    );
  }
}
