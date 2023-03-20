import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/model/todo.dart';
import '../viewmodel/module.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      onDismissed: (direction) {
        final newTodo = todo.copyWith(completed: !todo.completed);
        ref.read(todosListModel).save(newTodo);
      },
      key: GlobalKey(),
      child: ListTile(
        title: Text(todo.title),
        subtitle: todo.description != null && todo.description!.isNotEmpty
            ? Text(todo.description!)
            : null,
        onTap: () {
          context.push('/todos/${todo.id}');
        },
      ),
    );
  }
}
