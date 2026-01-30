import 'package:flutter/material.dart';

class NoTasksPlaceholder extends StatelessWidget {
  const NoTasksPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final texts = theme.textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("🍃", style: TextStyle(fontSize: 60)),
          Text(
            "Tu jardín está vacío",
            style: texts.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Agrega oruga-actividades para \n empezar a concentrarte en tus objetivos",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
