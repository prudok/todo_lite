import 'package:freezed_annotation/freezed_annotation.dart';
import './todo.dart';

part 'todos.freezed.dart';
part 'todos.g.dart';

@freezed
class Todos with _$Todos {
  const factory Todos({
    @Default([]) List<Todo> values,
  }) = _Todos;

  factory Todos.fromJson(Map<String, Object?> json)
      => _$TodosFromJson(json);
}