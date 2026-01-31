import 'package:flutter/material.dart';
import 'package:garfly/core/di/injection_container.dart';
import 'package:garfly/features/tasks/domain/entities/task.dart';
import 'package:garfly/features/tasks/domain/use_cases/add_task.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _NewTaskSheetState();
}

class _NewTaskSheetState extends State<AddTaskForm> {
  final TextEditingController _nameController = TextEditingController();

  void _onSavePressed(BuildContext context) async {
    try {
      final name = _nameController.text.trim();

      if (name.isEmpty) return;

      final newTask = Task(name: name);

      // sl<AddTask>() busca el caso de uso, que a su vez usa el repo, etc.
      await serviceLocator<AddTask>().call(newTask);

      if (!context.mounted) return;

      _nameController.clear();
      // Aquí devolveremos el dato a la pantalla principal
      Navigator.pop(context, true);
    } catch (e) {
      // Manejo de errores simple
      debugPrint("Error al guardar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final texts = theme.textTheme;
    final colors = theme.colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        height: screenHeight * .9,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.all(0),
              icon: const Icon(Icons.arrow_back_ios, size: 20),
            ),
            const SizedBox(height: 10),
            Text("¿Cuál es tu actividad?", style: texts.headlineLarge),
            const SizedBox(height: 8),
            Text(
              "Toda gran mariposa comenzó siendo una pequeña oruga. ¿Qué objetivo quieres alimentar hoy?",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                height: 1.4, // Para que el texto respire si ocupa dos líneas
              ),
            ),
            const SizedBox(height: 20),
            // Input del diseño
            TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: "Ejercitarse..."),
              textCapitalization: TextCapitalization.sentences,
            ),
            const Spacer(), // Empuja el botón hacia abajo
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: colors.scrim),
              onPressed: () => _onSavePressed(context),
              child: const Text(
                "Guardar",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
