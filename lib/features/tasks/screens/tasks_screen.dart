import 'package:flutter/material.dart';
import 'package:garfly/features/tasks/widgets/add_task_form.dart';
import 'package:garfly/features/tasks/widgets/tasks_list.dart';
import 'package:garfly/features/tasks/widgets/day_tasks_completed.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List _tasks = [];

  void _openAddTaskForm(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true, // Permite que suba hasta arriba
      backgroundColor:
          Colors.transparent, // Para ver los bordes redondeados del Container
      builder: (context) => const AddTaskForm(),
    );

    print(result);

    // setState(() {
    //   _tasks.add(result);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            horizontal: 14,
            vertical: 4,
          ),
          child: Column(
            spacing: 15,
            children: [
              const DayTasksCompleted(),
              Expanded(child: TasksList(tasks: _tasks)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddTaskForm(context),
        backgroundColor: colors.scrim,
        tooltip: "Agregar actividad",
        child: const Icon(Icons.add),
      ),
    );
  }
}
