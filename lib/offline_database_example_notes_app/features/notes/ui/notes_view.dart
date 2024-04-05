import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app_navigatior.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/addNote/add_note_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/editNote/edite_note_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/ui/notes_view_model.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/main_button.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/notes_service.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/toast_service.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/theme/colors.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/ui/widgets/note_card.dart';
import 'package:provider/provider.dart';

// ! Test data, will be removed later

// final List<Note> testData = List.generate(
//     20,
//     (index) => {
//           'id': index,
//           'content': "content of note $index",
//           'title': "Note $index",
//         }).map((json) => Note.fromJSON(json)).toList();

// !---------!

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
      body: ChangeNotifierProvider(
        create: (context) => NotesViewModel(),
        builder: (context, _) {
          final NotesViewModel notesViewModel = context.watch<NotesViewModel>();

          return notesViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ChangeNotifierProvider.value(
                  value: notesService,
                  builder: (context, _) {
                    final viewModel = context.watch<NotesService>();
                    return viewModel.notes != null && viewModel.notes!.isNotEmpty
                        ? ListView.builder(
                            itemCount: viewModel.notes!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: index == 0 ? 24 : 0,
                                  bottom: 12,
                                ),
                                child: GestureDetector(
                                  onLongPress: () => AppNavigator.push(
                                    EditNoteView(note: viewModel.notes![index]!),
                                  ),
                                  onTap: () => toastService.popUpMenu(
                                      context,
                                      (
                                        yes: MainButton(
                                          onTap: () async {
                                            Navigator.pop(context);

                                            await notesViewModel.delete(viewModel.notes![index]!);
                                          },
                                          backgroundColor: const Color(0xffc30101),
                                          height: 42,
                                          width: 100,
                                          child: const Text("Yes"),
                                        ),
                                        no: MainButton(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          height: 42,
                                          width: 80,
                                          child: const Text("No"),
                                        ),
                                      ),
                                      "Are you sure you want to delete this note?"),
                                  child: NoteCard(
                                    note: viewModel.notes![index]!,
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                              "Whats on your mind?",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColorsNotes.mainThemeColor,
        onPressed: () => AppNavigator.push(const AddNoteView()),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
