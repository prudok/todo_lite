import 'package:todolite/domain/repository/todos.dart';

import '../../model/todos.dart';
import 'get_todos.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  GetTodosUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<Todos> execute() async => todosRepository.loadTodos();
}
