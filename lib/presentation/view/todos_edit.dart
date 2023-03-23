import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shortid/shortid.dart';

import '../../domain/model/todo.dart';
import '../viewmodel/module.dart';
import '../widgets/extensions.dart';
import '../widgets/todo_form.dart';

class TodosEdit extends ConsumerStatefulWidget {
  static const routeName = 'new';
  const TodosEdit({super.key, this.todoId});
  final String? todoId;

  @override
  ConsumerState<TodosEdit> createState() => _TodosEditState();
}

class _TodosEditState extends ConsumerState<TodosEdit> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late final model = ref.read(todosListModel);
  bool isCompleted = false;
  bool edited = false;

  void change() {
    if (mounted) {
      setState(() {
        edited = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    titleController.addListener(change);
    descriptionController.addListener(change);

    if (widget.todoId != null) {
      model.get(widget.todoId!).then((value) {
        if (value != null) {
          titleController.text = value.title;
          descriptionController.text = value.description ?? '';
          if (mounted) {
            setState(() {
              isCompleted = value.completed;
              edited = false;
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.todoId == null
            ? const Text('New Todo')
            : const Text('Edit Todo'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            onWillPop: () async {
              if (edited) {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Discard changes?'),
                    content: const Text(
                      'Are you sure you want to discard changes?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.error,
                        ),
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
                return confirmed ?? false;
              }
              return true;
            },
            child: TodoForm(
              titleController: titleController,
              descriptionController: descriptionController,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: widget.todoId == null
            ? const Icon(Icons.add)
            : const Icon(Icons.edit),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            final todo = Todo(
              id: widget.todoId ?? shortid.generate(),
              title: titleController.text,
              description: descriptionController.text,
              completed: isCompleted,
            );

            final messenger = ScaffoldMessenger.of(context);
            final router = GoRouter.of(context);
            await model.save(todo);
            messenger.toast('Todo saved!');
            await model.loadTodos();
            if (router.canPop()) {
              router.pop();
            }
          }
        },
      ),
    );
  }
}
