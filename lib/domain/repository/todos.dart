import '../model/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> loadTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);

  Future<Todo?> getTodoById(String id);

  Future<void> deleteAllTodos();
}
