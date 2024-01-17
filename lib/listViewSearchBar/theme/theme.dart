import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final main = Colors.blue.withOpacity(0.50);
}

class AppTheme {
  AppTheme._();

  static ThemeData getTheme() => ThemeData(
        colorScheme: ColorScheme.light(
          surface: AppColors.main,
        ),
        inputDecorationTheme: inputTheme,
      );
}

final inputTheme = () {
  // Create a stadium like input border by adding a border radius to OutlineInputBorder
  final sharedInputBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(
      color: AppColors.main,
      width: 2.5,
    ),
  );
  return InputDecorationTheme(
    enabledBorder: sharedInputBorder,
    focusedBorder: sharedInputBorder,
    focusedErrorBorder: sharedInputBorder,
    errorBorder: sharedInputBorder,
    floatingLabelStyle: TextStyle(color: AppColors.main),
  );
}();
