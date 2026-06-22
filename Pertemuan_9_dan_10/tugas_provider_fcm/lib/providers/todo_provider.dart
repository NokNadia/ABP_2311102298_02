import 'package:flutter/foundation.dart';
import '../models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  void addTodo(String title) {
    if (title.trim().isEmpty) return;
    final todo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title.trim(),
    );
    _todos.insert(0, todo);
    notifyListeners();
  }

  void removeAll() {
    _todos.clear();
    notifyListeners();
  }

  void removeById(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
