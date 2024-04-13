import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app/theme/colors.dart';

class AppThemeNotes {
  AppThemeNotes._();
  static ThemeData getTheme() {
    return ThemeData(
      appBarTheme: appBarTheme,
      inputDecorationTheme: inputDecorationTheme,
      outlinedButtonTheme: outlinedButtonTheme,
    );
  }
}

const appBarTheme = AppBarTheme(backgroundColor: AppColorsNotes.mainThemeColor);

const inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
  ),
);

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    side: resolver(BorderSide.none),
    backgroundColor: resolver(AppColorsNotes.mainThemeColor),
    textStyle: resolver(
      TextStyle(
        // color: Colors.white, // will not work
        foreground: Paint()..color = Colors.white, // will work | not sure why...
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
);

MaterialStateProperty<T> resolver<T>(T obj) {
  return MaterialStateProperty.resolveWith((states) => obj);
}
