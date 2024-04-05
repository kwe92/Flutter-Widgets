import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/database_service.dart';

final notesProviderService = NotesProviderService();

class NotesProviderService {
  Future<void> insert(Note note) async {
    await databaseService.db.insert(databaseService.tables.notes, note.toMap());
  }

  Future<List<Note>> getAllNotes() async {
    final List<Map<String, dynamic>> result = await databaseService.db.query(databaseService.tables.notes);

    // final List<Note> notes = List.generate(result.length, (index) => Note.fromJSON())
    final List<Note> notes = [for (Map<String, dynamic> note in result) Note.fromJSON(note)];

    return notes;
  }

  Future<void> delete(Note note) async {
    await databaseService.db.delete(databaseService.tables.notes, where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> edit(Note note) async {
    await databaseService.db.update(
      databaseService.tables.notes,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
