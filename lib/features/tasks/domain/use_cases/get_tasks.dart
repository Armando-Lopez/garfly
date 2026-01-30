import 'package:garfly/features/tasks/domain/entities/task.dart';
import 'package:garfly/features/tasks/domain/repositories/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  // Usamos 'call' para poder llamar a la clase como una función: getTasks()
  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}