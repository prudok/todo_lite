import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/module.dart';
import '../../domain/model/todos.dart';
part 'module.g.dart';

@riverpod
Future<Todos> getTodos(GetTodosRef ref) async {
  final todos = ref.watch(todosProvider);
  final items = await todos.loadTodos();
  return items;
}
