import 'save_todo.dart';
import '../model/todo.dart';
import '../repository/todos.dart';

class SaveTodoUseCaseImpl extends SaveTodoUseCase{
  SaveTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<void> execute(Todo todo) => todosRepository.saveTodo(todo);
}