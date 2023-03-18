import 'package:go_router/go_router.dart';
import 'package:todolite/presentation/view/todos_new.dart';

import '../view/todos_list.dart';

final router = GoRouter(
  initialLocation: '/todos',
  routes: [
    GoRoute(
      path: '/todos',
      builder: (context, state) => const TodosList(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) => const TodosNew(),
        ),
      ],
    ),
  ],
);
