import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app_navigatior.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/addNote/widgets/image_layout.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/editNote/edit_note_view_model.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/main_button.dart';
import 'package:provider/provider.dart';

// TODO: add form validation

class EditNoteView extends StatelessWidget {
  final Note note;
  const EditNoteView({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EditNoteViewModel(note),
        builder: (context, _) {
          final EditNoteViewModel viewModel = context.watch<EditNoteViewModel>();
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              leading: IconButton(
                onPressed: () async {
                  viewModel.cancelEdit();
                  await AppNavigator.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              title: const Text(
                'Edit Note',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
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
                        const SizedBox(height: 16),
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
                      ? Expanded(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: viewModel.images.length > 6 ? 16.0 : 0,
                              ),
                              child: SingleChildScrollView(
                                child: ImageLayout(
                                  removeImageCallback: viewModel.markImageForDeletion,
                                  images: viewModel.images,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: viewModel.images.isEmpty ? 24.0 : 0.0,
                      bottom: viewModel.images.isNotEmpty ? 32.0 : 0.0,
                    ),
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
                ],
              ),
            ),
          );
        });
  }
}
