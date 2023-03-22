import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.primary,
  brightness: Brightness.light,
);

ThemeData lightTheme() => ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: lightColorScheme,
      dividerColor: Colors.transparent,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: lightColorScheme.background,
        contentTextStyle: const TextStyle(color: Colors.black),
      ),
    );
