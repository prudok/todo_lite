import 'package:flutter/material.dart';
import './router.dart';

class TodosApp extends StatelessWidget {
  const TodosApp({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: place in another folder(utils).
    const color = Colors.purple;
    final lightColorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );
    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );
    //

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Todos',
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: lightColorScheme,
        dividerColor: Colors.transparent,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: lightColorScheme.background,
          contentTextStyle: const TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: darkColorScheme,
        dividerColor: Colors.transparent,
        snackBarTheme: SnackBarThemeData(
            backgroundColor: darkColorScheme.background,
            contentTextStyle: const TextStyle(color: Colors.white)),
      ),
      themeMode: ThemeMode.system,
    );
  }
}
