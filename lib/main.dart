import 'package:flutter/material.dart';
import 'package:flutter_widgets/awesome_notifications/awesomeNotificationExampleView.dart';
import 'package:flutter_widgets/complex_layout/complex_layout_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app_navigatior.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/ui/notes_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/theme/theme.dart';

void main() async {
  runApp(
    MaterialApp(
      navigatorKey: AppNavigatior.navigatorKey,
      home: const NotesView(),
      theme: AppThemeNotes.getTheme(),
      // home: ComplexLayoutExample(),

      // home: AwesomeNotificationExampleView(),
    ),
  );
}
