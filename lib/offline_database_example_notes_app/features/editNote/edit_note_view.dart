import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app_navigatior.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/addNote/widgets/image_layout.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/editNote/edit_note_view_model.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/main_button.dart';
import 'package:provider/provider.dart';

class EditNoteView extends StatelessWidget {
  final Note note;
  const EditNoteView({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Edit Note',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ChangeNotifierProvider(
          create: (context) => EditNoteViewModel(note),
          builder: (context, _) {
            final EditNoteViewModel viewModel = context.watch<EditNoteViewModel>();
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: Text(
                      "What has changed?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: viewModel.titleController,
                        onChanged: viewModel.setTitle,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: viewModel.contentController,
                        onChanged: viewModel.setContent,
                        maxLines: viewModel.images.isEmpty
                            ? 15
                            : viewModel.images.length < 4
                                ? 6
                                : 1,
                      ),
                    ],
                  ),
                ),
                viewModel.images.isNotEmpty
                    ? Flexible(
                        flex: 4,
                        child: Center(
                          child: SingleChildScrollView(
                            child: ImageLayout(
                              removeImageCallback: viewModel.removeImage,
                              images: viewModel.images,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MainButton(
                          onTap: () async => await viewModel.pickImages(),
                          height: 65,
                          child: const Text("Select Image"),
                        ),
                        const SizedBox(height: 12),
                        MainButton(
                          onTap: () async {
                            await viewModel.edit(note);
                            AppNavigator.pop();
                          },
                          height: 65,
                          child: const Text("Edit"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
