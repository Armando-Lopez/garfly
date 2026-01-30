class Task {
  final int? id;
  final String name;
  final String? category;

  Task({this.id, required this.name, this.category});

  // Nota: Los métodos toMap y fromMap que usamos para SQLite
  // idealmente deberían ir en un "Model" en la capa de DATA,
}
