import 'package:flutter/foundation.dart';
import 'package:garfly/core/database/sql_database.dart';
import 'package:garfly/features/tasks/domain/entities/task.dart';
import 'package:garfly/features/tasks/data/models/task_model.dart';
import 'package:garfly/features/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final DatabaseHelper dbHelper;
  final tableName = "tasks";

  TaskRepositoryImpl(this.dbHelper);

  @override
  Future<void> saveTask(Task task) async {
    final db = await dbHelper.database; // Obtenemos la conexión
    final model = TaskModel.fromEntity(task);

    final id = await db.insert(tableName, model.toMap());

    // return id;
  }

  @override
  Future<List<Task>> getTasks() async {
    final db = await dbHelper.database;

    // Aquí puedes hacer consultas complejas, JOINs, filtros, etc.
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return maps.map((map) => TaskModel.fromMap(map)).toList();
  }
}
