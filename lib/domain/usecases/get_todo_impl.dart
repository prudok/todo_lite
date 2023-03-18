import 'get_todo.dart';
import '../model/todo.dart';
import '../repository/todos.dart';

class GetTodoUseCaseImpl extends GetTodoUseCase {
  GetTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<Todo?> execute(String id) => todosRepository.getTodoById(id);
}
