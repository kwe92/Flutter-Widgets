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

class AddNoteViewModel extends ChangeNotifier with NotesMixin {
  List<Photo> _photos = [];

  List<String> _photoStrings = [];

  List<ImageProvider> _images = [];

  List<ImageProvider> get images => _images;

  void setImages(List<ImageProvider> images) {
    _images = images;

    debugPrint("setImages Called: $_images");
    notifyListeners();
  }

  /// inserts new note into database and appends to list of notes in memory
  Future<void> save() async {
    final note = await _insertNote();

    note.images = _photos;

    // append note to list of notes in memory
    notesService.addNote(note);

    // clear all input variables
    cearVariables();

    debugPrint("Note saved successfully!");

    notifyListeners();
  }

  void cearVariables() {
    setTitle('');
    setContent('');
    titleController.clear();
    contentController.clear();
  }

  Future<Note> _insertNote() async {
    // instantiate note based on user input
    final note = Note(
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );

    // insert note into database and retrieve unique id
    final int id = await notesProviderService.insert(note);

    _photos = [for (String imageString in _photoStrings) Photo(noteID: id, imageName: imageString)];

    await PhotoProvider.insert(_photos);

    // assign unique id to note
    note.id = id;

    return note;
  }

  Future<void> pickImages() async {
    final result = await ImagePickerService.pickImages();

    _photoStrings = result.imageFiles != null ? await ImagePickerService.convertToString(result.imageFiles!) : [];

    setImages(ImagePickerService.toImageProvider(result.imageFiles ?? []));
  }
}
