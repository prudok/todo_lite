import 'package:todolite/domain/model/todo.dart';

import '../../domain/repository/todos.dart';
import '../source/files.dart';

class TodoRepositoryImpl extends TodosRepository {
  final Files files;

  TodoRepositoryImpl(this.files);

  @override
  Future<void> deleteAllTodos() {
    // TODO: implement deleteAllTodos
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<Todo?> getTodoById(String id) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> loadTodos() {
    // TODO: implement loadTodos
    throw UnimplementedError();
  }

  @override
  Future<void> saveTodo(Todo todo) {
    // TODO: implement saveTodo
    throw UnimplementedError();
  }
}
