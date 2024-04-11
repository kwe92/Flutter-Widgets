import 'package:collection/collection.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/models/photo.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/database_service.dart';

// responsible for all C.R.U.D operations associated with Note Objects
class NotesProvider {
  NotesProvider._();
  static Future<int> insert(Note note) async {
    return await databaseService.db.insert(databaseService.tables.notes, note.toMap());
  }

  static Future<List<Note>> getAllNotes() async {
    final List<Map<String, dynamic>> result = await databaseService.db.query(databaseService.tables.notes);

    List<Note> notes = [for (Map<String, dynamic> note in result) Note.fromJSON(note)];

    final List<Map<String, dynamic>> imageResult = await databaseService.db.query(databaseService.tables.images);

    final List<Photo> images = [for (Map<String, dynamic> image in imageResult) Photo.fromJSON(image)];

    final groupedImages = groupBy(images, (image) => image.noteID);

    groupedImages.forEach((key, value) {
      for (var note in notes) {
        note.id == key ? note.images = value : null;
      }
    });

    return notes;
  }

  static Future<void> delete(Note note) async {
    await databaseService.db.delete(databaseService.tables.notes, where: 'id = ?', whereArgs: [note.id]);
  }

  static Future<void> edit(Note note) async {
    await databaseService.db.update(
      databaseService.tables.notes,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
