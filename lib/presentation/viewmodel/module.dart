import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/todos.dart';
import '../../domain/usecases/module.dart';

// final todoListProvider = ChangeNotifierProvider<ValueNotifier<Todos>>((ref) {
//   return ValueNotifier(const Todos(values: []));
// });

class TodosStateNotifier extends StateNotifier<Todos> {
  TodosStateNotifier(this.ref) : super(const Todos(values: [])) {
    loadTodos();
  }

  final Ref ref;
  late final getTodos = ref.read(getTodosProvider);

  Future<void> loadTodos() async {
    state = await getTodos.execute();
  }
}

final todosListState = 
    StateNotifierProvider<TodosStateNotifier, Todos>((ref) {
  return TodosStateNotifier(ref);
});

final todoListModel = Provider<TodosStateNotifier>((ref) {
  return ref.watch(todosListState.notifier);
});
