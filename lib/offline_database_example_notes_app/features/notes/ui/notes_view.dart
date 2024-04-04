import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app_navigatior.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/addNote/add_note_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/theme/colors.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/ui/widgets/note_card.dart';

// ! Test data, will be removed later
final List<Note> testData = List.generate(
    20,
    (index) => {
          'id': index,
          'content': "content of note $index",
          'title': "Note $index",
        }).map((json) => Note.fromJSON(json)).toList();

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsNotes.mainThemeColor,
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: testData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: index == 0 ? 24 : 0,
              bottom: 12,
            ),
            child: NoteCard(note: testData[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColorsNotes.mainThemeColor,
        onPressed: () => AppNavigatior.push(const AddNoteView()),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
