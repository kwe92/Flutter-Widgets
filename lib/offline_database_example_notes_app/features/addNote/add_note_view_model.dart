// ignore_for_file: prefer_final_fields

//   - error ignored because we want private member variables to be mutable

import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/notes_provider.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/notes_service.dart';

class AddNoteViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  String _title = '';

  String _content = '';

  String get title => _title;

  String get content => _content;

  void setTitle(String value) {
    _title = value;
    debugPrint("title: $_title");
    notifyListeners();
  }

  void setContent(String value) {
    _content = value;
    debugPrint("content: $_content");
    notifyListeners();
  }

  Future<void> save() async {
    final note = Note(
      content: content,
      title: title,
      createdAt: DateTime.now(),
    );
    _title = '';
    _content = '';
    titleController.clear();
    contentController.clear();

    notesService.addNote(note);

    await notesProviderService.insert(note);

    debugPrint("Note saved successfully!");

    notifyListeners();
  }
}
