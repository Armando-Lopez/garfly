import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final texts = theme.textTheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(child: SingleChildScrollView(
        child: Text("Orugas"),
      )),
    );
  }
}
