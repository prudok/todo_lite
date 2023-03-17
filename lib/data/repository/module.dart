import 'package:flutter_riverpod/flutter_riverpod.dart';

import './todos_impl.dart';
import '../../domain/repository/todos.dart';

final todosProvider = Provider<TodosRepository>((ref) {
  return TodoRepositoryImpl();
});
