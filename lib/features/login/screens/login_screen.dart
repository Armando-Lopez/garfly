import 'package:flutter/material.dart';
import 'package:garfly/features/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final texts = theme.textTheme;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: colors.surface,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _HeaderImage(),
                    const SizedBox(height: 20),
                    Text(
                      "Te damos la bienvenida a tu jardin de hábitos",
                      style: texts.displayLarge?.copyWith(color: colors.primary),
                      textAlign: TextAlign.center,
                      
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Recolectemos algunos detalles para comenzar tu metamorfosis",
                      style: texts.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const LoginForm()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          "assets/images/chrysalis.png",
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}