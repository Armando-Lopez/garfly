# 🏗️ Guía de Arquitectura Limpia y Hexagonal - Garfly

Esta documentación detalla la estructura y principios aplicados en el desarrollo de **Garfly**. El objetivo central es mantener la **UI totalmente aislada de la base de datos y de la implementación técnica**, protegiendo la lógica de negocio en una capa pura.

---

## 📂 Estructura de Carpetas

```text
lib/
 ├── core/                        # Infraestructura compartida
 │    ├── database/               # Configuración de SQLite (DatabaseHelper)
 │    └── di/                     # Inyección de Dependencias (Service Locator)
 ├── features/                    # Funcionalidades divididas por módulos
 │    └── tasks/                  # Módulo de Tareas/Orugas
 │         ├── data/              # Capa de Datos (Implementación técnica)
 │         │    ├── models/       # Modelos con lógica de mapas (toMap/fromMap)
 │         │    └── repositories/ # Implementación del contrato del repositorio
 │         ├── domain/            # Capa de Dominio (Corazón del negocio)
 │         │    ├── entities/     # Objetos de datos puros (Dart)
 │         │    ├── repositories/ # Contratos/Interfaces
 │         │    └── use_cases/    # Servicios con una única responsabilidad
 │         └── presentation/      # Capa Visual (Flutter)
 │              ├── screens/      # Pantallas principales
 │              └── widgets/      # Componentes visuales reutilizables
 └── main.dart                    # Inicialización de la App


## ⚙️ 1. Capa Core (Infraestructura)

### DatabaseHelper (`sql_database.dart`)
Es el responsable de gestionar la conexión física con SQLite.
* **Función:** Centraliza la apertura de la DB y la creación de tablas [cite: 2026-01-30].
* **Nullable:** Para permitir registros nulos, se define el campo en el `CREATE TABLE` sin el modificador `NOT NULL` [cite: 2026-01-30].

### Service Locator (`injection_container.dart`)
Utilizamos el paquete `get_it` para gestionar la Inyección de Dependencias (DI).
* **sl (Service Locator):** Es el asistente que "entrega" las instancias de las clases a quien las pida.
* **registerLazySingleton:** Registra una clase para que se cree solo la primera vez que se usa y sea única en toda la app [cite: 2026-01-30].
* **Ejemplo:** `sl.registerLazySingleton(() => AddTask(sl()));`. El `sl()` interno busca automáticamente la dependencia que el caso de uso necesita (el repositorio).

---

## 🧠 2. Capa Domain (El Corazón)
Es la capa más estable. No conoce nada de bases de datos ni de Flutter [cite: 2026-01-30].

### Entidades vs Modelos
| Concepto | Ubicación | Descripción |
| :--- | :--- | :--- |
| **Entity** (`task.dart`) | `domain/entities` | Objeto Dart puro con los datos que necesita el negocio. No sabe qué es SQLite [cite: 2026-01-30]. |
| **Model** (`task_model.dart`) | `data/models` | Versión técnica de la entidad. Hereda de la Entity y tiene métodos `toMap()` y `fromMap()` para persistencia [cite: 2026-01-30]. |

### Casos de Uso (Use Cases)
Clases que ejecutan una sola acción del usuario (ej. `get_tasks.dart` o `add_task.dart`).
* **Diferencia con Service:** Un "Service" agrupa muchas funciones. El Use Case se enfoca en una sola tarea, lo que facilita el mantenimiento y el testeo [cite: 2026-01-30].
* **Inyección:** El Use Case recibe el **Contrato** (interfaz), no la implementación, manteniendo la independencia [cite: 2026-01-30].

---

## 🛠️ 3. Capa Data (Implementación Técnica)

### Repositorios Implementación (`task_repository_impl.dart`)
Es el puente entre el mundo abstracto del dominio y la base de datos real.
* **Lógica:** Recibe una Entidad de la capa superior, la convierte en un Modelo y usa el `DatabaseHelper` para guardarla en SQLite [cite: 2026-01-30].
* **Separación:** Al separar la interfaz (Domain) de la implementación (Data), podemos cambiar SQLite por una API web en el futuro sin tocar la lógica de negocio [cite: 2026-01-30].

---

## 🎨 4. Capa Presentation (UI)
* **Screens:** Definen la estructura de la página.
* **Widgets:** Componentes como `TaskCard` o `AddTaskForm`.
* **Regla de Oro:** La UI solo se comunica con los **Casos de Uso** [cite: 2026-01-30]. Nunca debe llamar directamente al repositorio ni a la base de datos.

---

## 🔄 Flujo de Datos (Comunicación)

### Entrada (UI -> DB)
1. La **UI** crea una **Entity**.
2. La envía al **UseCase**.
3. El **RepositoryImpl** la transforma en **Model**.
4. El **Model** se convierte en **Map** y entra a **SQLite**.

### Salida (DB -> UI)
1. **SQLite** devuelve un **Map**.
2. El **RepositoryImpl** lo convierte en **Model** mediante `fromMap`.
3. El **Model** viaja hacia arriba como una **Entity**.
4. La **UI** lo recibe y lo renderiza.