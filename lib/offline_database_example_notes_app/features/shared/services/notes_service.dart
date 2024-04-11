import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/notes_provider.dart';

final notesService = NotesService();

class NotesService extends ChangeNotifier {
  List<Note?>? _notes;

  List<Note?>? get notes => _notes;

  Future<void> getNotes() async {
    _notes = await notesProviderService.getAllNotes();
    notifyListeners();
  }

  void addNote(Note note) {
    _notes!.add(note);
    debugPrint("addNote: $_notes");
    debugPrint("Note added successfully.");
    notifyListeners();
  }

  void deleteNote(Note note) {
    _notes!.remove(note);
    debugPrint("Note deleted successfully.");
    notifyListeners();
  }

  void replaceNote(Note note, Note prevNote) {
    final index = _notes!.indexOf(prevNote);

    _notes!.removeWhere((note) => note!.id == prevNote.id);

    _notes!.insert(index, note);

    debugPrint("replaceNote notes: $_notes");

    debugPrint("Note replaced successfully.");
    notifyListeners();
  }
}
