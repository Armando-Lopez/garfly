import 'package:garfly/features/tasks/domain/entities/task.dart';
import 'package:garfly/features/tasks/domain/repositories/task_repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<void> call(Task task) async {
    // Aquí podrías validar, por ejemplo, que el nombre no sea corto
    if (task.name.isEmpty) throw Exception("Tu oruga necesita un nombre");

    return await repository.saveTask(task);
  }
}
