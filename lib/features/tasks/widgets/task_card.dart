import 'package:flutter/material.dart';
import 'package:garfly/features/tasks/domain/entities/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Text(task.name);
  }
}
