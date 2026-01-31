import 'package:get_it/get_it.dart';
import 'package:garfly/core/database/sql_database.dart';
import 'package:garfly/features/tasks/domain/use_cases/add_task.dart';
import 'package:garfly/features/tasks/domain/use_cases/get_tasks.dart';
import 'package:garfly/features/tasks/domain/repositories/task_repository.dart';
import 'package:garfly/features/tasks/data/repositories/task_repository_impl.dart';

final serviceLocator = GetIt.instance;
final  _sl = serviceLocator; //Service locator

Future<void> init() async {
  // -------------------------------------------------------------------
  // 1. CASOS DE USO (Use Cases)
  // -------------------------------------------------------------------
  // Registramos AddTask. Cuando se pida, _sl() buscará automáticamente 
  // el TaskRepository que registramos más abajo.
  // -------------------------------------------------------------------
  // 2. REPOSITORIOS (Repositories)
  // -------------------------------------------------------------------
  // Registramos la implementación (TaskRepositoryImpl) bajo el contrato
  // de la interfaz (TaskRepository). Esto permite que el Use Case no sepa
  // si los datos vienen de SQL o de una API

  // ---- TASKS ----
  _sl.registerLazySingleton(() => AddTask(_sl()));
  _sl.registerLazySingleton(() => GetTasks(_sl()));
  _sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(_sl()),
  );


 // -------------------------------------------------------------------
  // 3. FUENTES DE DATOS (Data Sources / DB)
  // -------------------------------------------------------------------
  // Registramos la instancia de tu base de datos SQLite.
  _sl.registerLazySingleton(() => DatabaseHelper.instance); 
}