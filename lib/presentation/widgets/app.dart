import 'package:flutter/material.dart';

import '../../config/routes/router.dart';
import '../../config/themes/darkThemeData.dart';
import '../../config/themes/ligthThemeData.dart';

class TodosApp extends StatelessWidget {
  const TodosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Todos',
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: ligthThemeData(),
      darkTheme: darkThemeData(),
      themeMode: ThemeMode.system,
    );
  }
}
