// ignore_for_file: prefer_final_fields

//   - error ignored because we want private member variables to be mutable

import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/notes_provider.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/notes_mixin.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/notes_service.dart';

class EditNoteViewModel extends ChangeNotifier with NotesMixin {
  EditNoteViewModel(Note note) {
    titleController.text = note.title;
    contentController.text = note.content;
    setTitle(note.title);
    setContent(note.content);
  }

  Future<void> edit(Note prevNote) async {
    // TODO: change created at to updated at
    final updatedNote = Note(
      id: prevNote.id,
      content: content,
      title: title,
      createdAt: DateTime.now(),
    );

    await notesProviderService.edit(updatedNote);

    clearInput();

    notesService.replaceNote(updatedNote, prevNote);

    debugPrint("Note edited successfully!");

    notifyListeners();
  }

  void clearInput() {
    setTitle('');
    setContent('');

    titleController.clear();

    contentController.clear();
  }
}
