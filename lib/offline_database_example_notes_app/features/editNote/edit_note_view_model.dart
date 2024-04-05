// ignore_for_file: prefer_final_fields

//   - error ignored because we want private member variables to be mutable

import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/notes_provider.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/notes_service.dart';

class EditNoteViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  EditNoteViewModel(Note note) {
    titleController.text = note.title;
    contentController.text = note.content;
    setTitle(note.title);
    setContent(note.content);
  }

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

  Future<void> edit(Note prevNote) async {
    // TODO: change created at to updated at
    final updatedNote = Note(
      id: prevNote.id,
      content: content,
      title: title,
      createdAt: DateTime.now(),
    );

    _title = '';

    _content = '';

    titleController.clear();

    contentController.clear();

    await notesProviderService.edit(updatedNote);

    notesService.replaceNote(updatedNote, prevNote);

    debugPrint("Note edited successfully!");

    notifyListeners();
  }
}
