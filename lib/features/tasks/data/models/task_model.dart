import 'package:garfly/features/tasks/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    super.id,
    super.category,
    required super.name
  });

  // El "Traductor": De Mapa (SQLite) a Modelo
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map["id"],
      name: map["name"],
      category: map["category"]
    );
  }

  // El "Traductor": De Modelo a Mapa (SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
    };
  }

  // Para convertir una Entidad pura en un Modelo
  factory TaskModel.fromEntity(Task task) {
    return TaskModel(
      id: task.id,
      name: task.name,
      category: task.category,
    );
  }
}