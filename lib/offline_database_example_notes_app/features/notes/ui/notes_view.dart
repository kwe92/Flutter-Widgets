import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app/app_navigatior.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/addNote/add_note_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/editNote/edit_note_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/ui/notes_view_model.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/main_button.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/toast_service.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app/theme/colors.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/ui/widgets/note_card.dart';
import 'package:provider/provider.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesViewModel(),
      builder: (context, child) {
        final NotesViewModel viewModel = context.watch<NotesViewModel>();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColorsNotes.mainThemeColor,
            title: const Text(
              'Notes',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: viewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : viewModel.notes != null && viewModel.notes!.isNotEmpty
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
                            ).then((value) => viewModel.update()),
                            onTap: () => toastService.popUpMenu(
                                context,
                                (
                                  yes: MainButton(
                                    onTap: () async {
                                      await viewModel.delete(viewModel.notes![index]!);
                                      AppNavigator.pop();
                                    },
                                    backgroundColor: const Color(0xffc30101),
                                    height: 42,
                                    width: 100,
                                    child: const Text("Yes"),
                                  ),
                                  no: MainButton(
                                    onTap: () => Navigator.pop(context),
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
                    ),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: AppColorsNotes.mainThemeColor,
            onPressed: () => AppNavigator.push(const AddNoteView()).then((value) => viewModel.update()),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}


// class NotesView extends StatelessWidget {
//   const NotesView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColorsNotes.mainThemeColor,
//         title: const Text(
//           'Notes',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (context) => NotesViewModel()),
//           ChangeNotifierProvider.value(value: notesService),
//         ],
//         builder: (context, _) {
//           final NotesViewModel notesViewModel = context.watch<NotesViewModel>();

//           final NotesService notesServiceModel = context.watch<NotesService>();

//           return notesViewModel.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : notesServiceModel.notes != null && notesServiceModel.notes!.isNotEmpty
//                   ? ListView.builder(
//                       itemCount: notesServiceModel.notes!.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: EdgeInsets.only(
//                             top: index == 0 ? 24 : 0,
//                             bottom: 12,
//                           ),
//                           child: GestureDetector(
//                             onLongPress: () => AppNavigator.push(
//                               EditNoteView(note: notesServiceModel.notes![index]!),
//                             ),
//                             onTap: () => toastService.popUpMenu(
//                                 context,
//                                 (
//                                   yes: MainButton(
//                                     onTap: () async {
//                                       Navigator.pop(context);

//                                       await notesViewModel.delete(notesServiceModel.notes![index]!);
//                                     },
//                                     backgroundColor: const Color(0xffc30101),
//                                     height: 42,
//                                     width: 100,
//                                     child: const Text("Yes"),
//                                   ),
//                                   no: MainButton(
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                     },
//                                     height: 42,
//                                     width: 80,
//                                     child: const Text("No"),
//                                   ),
//                                 ),
//                                 "Are you sure you want to delete this note?"),
//                             child: NoteCard(
//                               note: notesServiceModel.notes![index]!,
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   : const Center(
//                       child: Text(
//                         "Whats on your mind?",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         shape: const CircleBorder(),
//         backgroundColor: AppColorsNotes.mainThemeColor,
//         onPressed: () => AppNavigator.push(const AddNoteView()),
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
