import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/todo.dart';
import '../../domain/model/todos.dart';
import '../../domain/usecases/module.dart';

class TodosStateNotifier extends StateNotifier<Todos> {
  TodosStateNotifier(this.ref) : super(const Todos(values: [])) {
    loadTodos();
  }

  final Ref ref;
  late final getTodos = ref.read(getTodosProvider);

  Future<void> loadTodos() async {
    state = await getTodos.execute();
  }

  Future<void> save(Todo todo) async {
    await ref.read(saveTodoProvider).execute(todo);
  }

  Future<Todo?> get(String id) async {
    return await ref.read(getTodoProvider).execute(id);
  }

  List<Todo> getCompletedTodos() {
    return state.values.where((todo) => todo.completed).toList();
  }

  List<Todo> getActiveTodos() {
    return state.values.where((todo) => !todo.completed).toList();
  }
}

final todosListState = StateNotifierProvider<TodosStateNotifier, Todos>((ref) {
  return TodosStateNotifier(ref);
});

final todoListModel = Provider<TodosStateNotifier>((ref) {
  return ref.watch(todosListState.notifier);
});
