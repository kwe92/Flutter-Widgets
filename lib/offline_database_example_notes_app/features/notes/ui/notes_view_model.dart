import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/notes_provider.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/extended_change_notifier.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/notes_service.dart';

class NotesViewModel extends ExtendedChangeNotifier {
  List<Note?>? get notes => notesService.notes;

  NotesViewModel() {
    initialize();
  }

  Future<void> initialize() async {
    setBusy(true);

    await notesService.getNotes();

    setBusy(false);
  }

  Future<void> delete(Note note) async {
    setBusy(true);

    await notesProviderService.delete(note);

    notesService.deleteNote(note);

    setBusy(false);
  }
}
