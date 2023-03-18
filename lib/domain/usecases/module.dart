import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'get_todos.dart';
import 'get_todos_impl.dart';
import '../../data/repository/module.dart';

final getTodosProvider = Provider<GetTodosUseCase>((ref) {
  return GetTodosUseCaseImpl(ref.read(todosProvider));
});
