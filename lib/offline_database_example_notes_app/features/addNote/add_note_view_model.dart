// ignore_for_file: prefer_final_fields

//   - error ignored because we want private member variables to be mutable

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/notes_provider.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/models/photo.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/models/photo_provider.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/notes_mixin.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/image_picker_service.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/notes_service.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/toast_service.dart';

class AddNoteViewModel extends ChangeNotifier with NotesMixin {
  List<Photo> _photos = [];

  List<String> _photoStrings = [];

  List<ImageProvider> _images = [];

  List<ImageProvider> get images => _images;

  void setImages(List<ImageProvider> images) {
    if (_images.isNotEmpty && (_images.length + images.length) <= 9) {
      _images.addAll(images);
      notifyListeners();
      return;
    }

    if (_images.isEmpty) {
      _images = images;
      notifyListeners();
      return;
    }

    toastService.showSnackbar("can only have up to 9 images per note.");

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
    _photos = [];
    _photoStrings = [];
    _images = [];
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

    await _insertImages(id);

    // assign unique id to note
    note.id = id;

    return note;
  }

  Future<void> pickImages() async {
    final result = await ImagePickerService.pickImages();

    _photoStrings = result.imageFiles != null ? await ImagePickerService.convertToString(result.imageFiles!) : [];

    setImages(ImagePickerService.toImageProvider(result.imageFiles ?? []));
  }

  Future<void> _insertImages(int noteID) async {
    _photos = [for (String imageString in _photoStrings) Photo(noteID: noteID, imageName: imageString)];

    List<int> photoIds = await PhotoProvider.insert(_photos);

    _photos.forEachIndexed((index, Photo photo) => photo.id = photoIds[index]);
  }
}
