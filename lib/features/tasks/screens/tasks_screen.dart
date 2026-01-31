import 'package:flutter/material.dart';
import 'package:garfly/core/di/injection_container.dart';
import 'package:garfly/features/tasks/widgets/tasks_list.dart';
import 'package:garfly/features/tasks/widgets/add_task_form.dart';
import 'package:garfly/features/tasks/domain/use_cases/get_tasks.dart';
import 'package:garfly/features/tasks/widgets/day_tasks_completed.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool _isLoadingTasks = true;
  List _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    try {
      final tasks = await serviceLocator<GetTasks>().call();

      if (!context.mounted) return;

      setState(() {
        _tasks = tasks;
        _isLoadingTasks = false;
      });
    } catch (e) {
      debugPrint("Error al cargar tareas: $e");
    } finally {
      setState(() {
        _isLoadingTasks = false;
      });
    }
  }

  void _openAddTaskForm(BuildContext context) async {
    final isSuccess = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true, // Permite que suba hasta arriba
      backgroundColor:
          Colors.transparent, // Para ver los bordes redondeados del Container
      builder: (context) => const AddTaskForm(),
    );

    if (isSuccess == true) {
      _loadTasks();
    }
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
              Expanded(
                child: _isLoadingTasks
                    ? const Center(child: CircularProgressIndicator())
                    : TasksList(tasks: _tasks),
              ),
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
