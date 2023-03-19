import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../viewmodel/module.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosListState);
    final model = ref.read(todoListModel);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Todos'),
      ),
      body: todos.values.isEmpty
          ? const Center(
              child: Text('No Todos found'),
            )
          : ListView.builder(
              itemCount: todos.values.length,
              itemBuilder: (context, index) {
                final todo = todos.values[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description != null
                      ? todo.description.toString()
                      : ''),
                  onTap: () {
                    context.push('/todos/${todo.id}');
                  },
                  trailing: Checkbox(
                      value: todo.completed,
                      onChanged: (value) {
                        if (value != null) {
                          final newTodo = todo.copyWith(completed: value);
                          model.save(newTodo);
                        }
                      }),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/todos/new');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
