import 'delete_todo.dart';
import '../model/todo.dart';
import '../repository/todos.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  DeleteTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<void> execute(Todo todo) async {
    await todosRepository.deleteTodo(todo);
  }
}