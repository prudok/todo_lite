import 'delete_todo.dart';
import '../repository/todos.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  DeleteTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<void> execute(String id) async {
    await todosRepository.deleteTodo(id);
  }
}