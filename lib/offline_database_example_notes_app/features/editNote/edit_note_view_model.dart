// ignore_for_file: prefer_final_fields

//   - error ignored because we want private member variables to be mutable

import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/notes_provider.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/models/photo.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/models/photo_provider.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/notes_mixin.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/image_picker_service.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/notes_service.dart';

class EditNoteViewModel extends ChangeNotifier with NotesMixin {
  late Note _note;
  Map<String, ImageProvider> images = {};
  List<Photo> imagesToDelete = [];

  EditNoteViewModel(Note note) {
    titleController.text = note.title;
    contentController.text = note.content;
    _note = note;
    images = note.images != null && note.images!.isNotEmpty ? ImagePickerService.imageFromBase64StringAsMap(note.images!) : {};
    setTitle(note.title);
    setContent(note.content);
  }

  Future<void> edit(Note prevNote) async {
    final updatedNote = Note(
      id: prevNote.id,
      content: content,
      title: title,
      images: _note.images,
      createdAt: prevNote.createdAt,
      updatedAt: DateTime.now(),
    );

    await notesProviderService.edit(updatedNote);

    await PhotoProvider.deleteMulti(imagesToDelete);

    clearInput();

    notesService.replaceNote(updatedNote, prevNote);

    debugPrint("Note edited successfully!");

    notifyListeners();
  }

  void clearInput() {
    setTitle('');
    setContent('');

    titleController.clear();

    contentController.clear();
  }

  void removeImage(ImageProvider image) {
    var imageToRemove;

    for (var entry in images.entries) {
      if (entry.value == image) {
        imageToRemove = entry.key;
        _note.images!.removeWhere((photo) {
          bool result = photo!.imageName == entry.key;
          if (result) {
            imagesToDelete.add(photo);
          }
          return result;
        });
      }
    }

    images.remove(imageToRemove);

    print("removed images left: ${_note.images}");
    print("imagesToDelete: $imagesToDelete");

    notifyListeners();
  }
}
