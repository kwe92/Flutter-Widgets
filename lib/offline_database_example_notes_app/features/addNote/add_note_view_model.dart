// ignore_for_file: prefer_final_fields

//   - error ignored because we want private member variables to be mutable

import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/notes_provider.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/notes_mixin.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/notes_service.dart';

class AddNoteViewModel extends ChangeNotifier with NotesMixin {
  /// inserts new note into database and appends to list of notes in memory
  Future<void> save() async {
    final note = await _insertNote();

    // append note to list of notes in memory
    notesService.addNote(note);

    // clear all input variables
    cearVariables();

    debugPrint("Note saved successfully!");

    notifyListeners();
  }

  void cearVariables() {
    setTitle('');
    setContent('');
    titleController.clear();
    contentController.clear();
  }

  Future<Note> _insertNote() async {
    // instantiate note based on user input
    final note = Note(
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );

    // insert note into database and retrieve unique id
    final int id = await notesProviderService.insert(note);

    // assign unique id to note
    note.id = id;

    return note;
  }
}
