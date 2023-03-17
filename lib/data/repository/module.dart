import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolite/data/source/module.dart';

import './todos_impl.dart';
import '../../domain/repository/todos.dart';

final todosProvider = Provider<TodosRepository>((ref) {
  return TodoRepositoryImpl(ref.read(filesProvider));
});
