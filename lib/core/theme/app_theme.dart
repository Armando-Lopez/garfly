import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get garflyTheme {
    const forestGreen = Color(0xFF2D6A4F);
    const mediumGray = Color(0x0090948a);
    const neonGreen = Color.fromARGB(255, 1, 179, 93);
    // const deepDark = Color(0xFF1B1C17);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: forestGreen,
        primary: forestGreen,
        outline: mediumGray,
        secondary: const Color(0xFF926247),
        tertiary: const Color(0xFF0077B6),
        surface: const Color(0xFFF8FAF5),
        scrim: neonGreen,
      ),

      // Tipografía Material 3
      textTheme: GoogleFonts.outfitTextTheme(
        const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 20),
          headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 16),
          // bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF44493F)),
        ),

        // Para las etiquetas encima de los inputs (Nombre, Género, etc.)
        // titleMedium: TextStyle(
        //   fontSize: 16,
        //   fontWeight: FontWeight.w500,
        //   color: Color(0xFF44493F), // Gris oliva para sutileza
        // ),
      ),


      // Botón de Acción Flotante
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: forestGreen,
        foregroundColor: Colors.white,
        shape: StadiumBorder(),
      ),

      // EXTENSIÓN PARA EL ONBOARDING: Inputs y Botones
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: neonGreen),
        ),
        hintStyle: TextStyle(
          color: Colors.grey
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: forestGreen,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
