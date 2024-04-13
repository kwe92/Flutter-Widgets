import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app/app_navigatior.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/addNote/add_note_view_model.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/addNote/widgets/image_layout.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/main_button.dart';
import 'package:provider/provider.dart';

// TODO: add form validation

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Add Note',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ChangeNotifierProvider(
          // declaratively instantiate view model | creation, storage, and disposal are abstracted away
          create: (context) => AddNoteViewModel(),
          builder: (context, _) {
            final AddNoteViewModel viewModel = context.watch<AddNoteViewModel>();
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: Text(
                      "What is on your mind?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      TextFormField(
                          controller: viewModel.titleController,
                          onChanged: viewModel.setTitle,
                          validator: (value) {
                            return value == null || value.isEmpty ? 'title can not be empty' : null;
                          }),
                      const SizedBox(height: 16),
                      TextFormField(
                          controller: viewModel.contentController,
                          onChanged: viewModel.setContent,
                          maxLines: viewModel.images.isEmpty
                              ? 12
                              : viewModel.images.length < 4
                                  ? 6
                                  : 1,
                          validator: (value) {
                            return value == null || value.isEmpty ? 'note body can not be empty' : null;
                          }),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: viewModel.images.length > 6 ? 16.0 : 0,
                      ),
                      child: SingleChildScrollView(
                        child: ImageLayout(removeImageCallback: viewModel.removeImage, images: viewModel.images),
                      ),
                    ),
                  ),
                ),
                Padding(
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
                          if (viewModel.formKey.currentState?.validate() ?? false) {
                            await viewModel.save();
                            AppNavigator.pop();
                          }
                        },
                        height: 65,
                        child: const Text("Save"),
                      ),
                    ],
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
