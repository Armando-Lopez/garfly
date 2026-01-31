import 'package:flutter/material.dart';
import 'package:garfly/features/tasks/widgets/task_card.dart';
import 'package:garfly/features/tasks/widgets/no_tasks_placeholder.dart';

class TasksList extends StatelessWidget {
  final List tasks;
  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? NoTasksPlaceholder()
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(task: tasks[index]);
            },
          );
  }
}
