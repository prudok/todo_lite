import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shortid/shortid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/module.dart';
import '../../domain/model/todo.dart';
import '../../domain/usecases/module.dart';

class TodosNew extends ConsumerStatefulWidget {
  const TodosNew({super.key});

  @override
  ConsumerState<TodosNew> createState() => _TodosNewState();
}

class _TodosNewState extends ConsumerState<TodosNew> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late final saveTodo = ref.read(saveTodoProvider);
  late final todosList = ref.read(todoListModel);
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New todo'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                CheckboxListTile(
                  title: const Text('Completed'),
                  value: isCompleted,
                  onChanged: (value) {
                    if (mounted) {
                      isCompleted = value!;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            final todo = Todo(
              id: shortid.generate(),
              title: titleController.text,
              description: descriptionController.text,
              completed: isCompleted,
            );

            final messenger = ScaffoldMessenger.of(context);
            final router = GoRouter.of(context);
            await saveTodo.execute(todo);
            messenger.toast('Todo saved!');
            await todosList.loadTodos();
            if (router.canPop()) {
              router.pop();
            }
          }
        },
      ),
    );
  }
}

extension on ScaffoldMessengerState {
  void toast(String message) {
    showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
