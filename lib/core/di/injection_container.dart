import 'package:get_it/get_it.dart';
import 'package:garfly/core/database/sql_database.dart';
import 'package:garfly/features/tasks/domain/use_cases/add_task.dart';
import 'package:garfly/features/tasks/domain/use_cases/get_tasks.dart';
import 'package:garfly/features/tasks/domain/repositories/task_repository.dart';
import 'package:garfly/features/tasks/data/repositories/task_repository_impl.dart';

final  sl = GetIt.instance; //Service locator

Future<void> init() async {
  // -------------------------------------------------------------------
  // 1. CASOS DE USO (Use Cases)
  // -------------------------------------------------------------------
  // Registramos AddTask. Cuando se pida, sl() buscará automáticamente 
  // el TaskRepository que registramos más abajo.
  // -------------------------------------------------------------------
  // 2. REPOSITORIOS (Repositories)
  // -------------------------------------------------------------------
  // Registramos la implementación (TaskRepositoryImpl) bajo el contrato
  // de la interfaz (TaskRepository). Esto permite que el Use Case no sepa
  // si los datos vienen de SQL o de una API

  // ---- TASKS ----
  sl.registerLazySingleton(() => AddTask(sl()));
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(sl()),
  );


 // -------------------------------------------------------------------
  // 3. FUENTES DE DATOS (Data Sources / DB)
  // -------------------------------------------------------------------
  // Registramos la instancia de tu base de datos SQLite.
  sl.registerLazySingleton(() => DatabaseHelper.instance); 
}