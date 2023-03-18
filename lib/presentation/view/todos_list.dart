import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../viewmodel/module.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Todos'),
      ),
      body: ref.watch(getTodosProvider).map(
            data: (todos) => ListView.builder(
                itemCount: todos.value.values.length,
                itemBuilder: (context, index) {
                  final todo = todos.value.values[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description != null
                        ? todo.description.toString()
                        : ''),
                  );
                }),
            error: (error) => Center(
              child: Text(
                error.stackTrace.toString(),
              ),
            ),
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/todos/new');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
