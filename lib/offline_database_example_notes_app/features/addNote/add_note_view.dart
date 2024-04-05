import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/addNote/add_note_view_model.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/main_button.dart';
import 'package:provider/provider.dart';

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
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: viewModel.titleController,
                        onChanged: viewModel.setTitle,
                      ),
                      const SizedBox(height: 36),
                      TextFormField(
                        controller: viewModel.contentController,
                        onChanged: viewModel.setContent,
                        maxLines: 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MainButton(
                          onTap: () {
                            viewModel.save();
                            Navigator.pop(context);
                          },
                          height: 65,
                          child: const Text("Save"),
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
