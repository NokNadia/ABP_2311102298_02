class Todo {
  final String id;
  final String title;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
