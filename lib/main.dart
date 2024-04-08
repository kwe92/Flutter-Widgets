import 'package:flutter/material.dart';
import 'package:flutter_widgets/complex_layout/complex_layout_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app_navigatior.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/ui/notes_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/database_service.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseService.initialize();
  runApp(
    MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,

      home: const NotesView(),
      theme: AppThemeNotes.getTheme(),
      // home: const ComplexLayoutExample(),

      // home: AwesomeNotificationExampleView(),
    ),
  );
}
