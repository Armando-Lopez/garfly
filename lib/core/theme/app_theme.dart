import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get garflyTheme {
    const forestGreen = Color(0xFF2D6A4F);
    const mediumGray = Color(0x0090948a);
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
    
      ),

      // Tipografía Material 3
      textTheme: GoogleFonts.outfitTextTheme(
        const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          headlineSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          // bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF44493F)),
        ),

        // Para las etiquetas encima de los inputs (Nombre, Género, etc.)
        // titleMedium: TextStyle(
        //   fontSize: 16,
        //   fontWeight: FontWeight.w500,
        //   color: Color(0xFF44493F), // Gris oliva para sutileza
        // ),
      ),

      // Estilo de Cards para las Orugas
      // cardTheme: CardTheme(
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      //   color: const Color(0xFFE2E9D8),
      // ),

      // Botón de Acción Flotante
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF2D6A4F),
        foregroundColor: Colors.white,
        shape: StadiumBorder(),
      ),

      // EXTENSIÓN PARA EL ONBOARDING: Inputs y Botones
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Color(0xFFE2E9D8)),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2D6A4F),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraints.maxWidth),
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.network(
//                           "https://lh3.googleusercontent.com/aida-public/AB6AXuA1Es9jUgs5tKav8N5JVU_fZWPTMyCQJy17WJTP-xBy08pjXUj4cUoyevC_CmkZYHk5VW1VmiYdn-0sU3gMhaKOJqCkZd1wk_KtPynVkKF2UQVFX9y70qOjBqlQbgXo2SY6Bt6vINsjoAwMaSbhmaZ64Pd8Dj8Zw4zrIOjIiZnPgUPlxEWIiZBNTnG1pkOs_SI3bjHA201K6NboqQlbN2fYSgGgEN-EXrjXYPttbrbm7b7j83mDA9dLZa_FiB_kb7-i0zPf9zyf7OA",
//                           width: 250,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       Text("10"),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
