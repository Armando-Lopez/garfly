import 'package:flutter/material.dart';
import 'package:garfly/core/widgets/garfly_card.dart';

class DayTasksCompleted extends StatelessWidget {
  const DayTasksCompleted({super.key});
  final todayCompletedTasks = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final texts = theme.textTheme;
    final colors = theme.colorScheme;

    return GarflyCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Metamorfosis hoy",
                style: texts.headlineSmall?.copyWith(color: colors.primary),
              ),
              const SizedBox(height: 4),
              Text(
                "$todayCompletedTasks actividad${todayCompletedTasks != 1 ? "es" : ""} completada${todayCompletedTasks != 1 ? "s" : ""}",
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colors.scrim.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: Text("🦋", style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
