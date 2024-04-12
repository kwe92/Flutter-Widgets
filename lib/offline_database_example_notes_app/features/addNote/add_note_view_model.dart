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
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class AddNoteViewModel extends ChangeNotifier with NotesMixin {
  List<Photo> _photos = [];

  List<String> _photoStrings = [];

  Map<String, ImageProvider> _imagesMap = {};

  List<ImageProvider> _images = [];

  List<ImageProvider> get images => _images;

  void setImages(List<ImageProvider> images) {
    if (isImageCount9orLess(images)) {
      _images.addAll(images);
      notifyListeners();
      return;
    }

    toastService.showSnackbar("images are limited to 9 per note.");

    debugPrint("setImages Called: $_images");
    notifyListeners();
  }

  bool isImageCount9orLess(List<ImageProvider> images) => _images.isEmpty || (_images.isNotEmpty && (_images.length + images.length) <= 9);

  /// inserts new note into database and append to list of notes in memory
  Future<void> save() async {
    // insert note into database
    final note = await _insertNote();

    // assign List of Photo objects
    note.images = _photos;

    // append note to list of notes in memory
    notesService.addNote(note);

    // clear all input variables
    cearVariables();

    debugPrint("Note saved successfully!");

    notifyListeners();
  }

  Future<Note> _insertNote() async {
    // instantiate note based on user input
    final note = Note(
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );

    // insert note into database and retrieve unique id
    final int id = await NotesProvider.insert(note);

    // insert images into database with associated note id
    await _insertImages(id);

    // assign unique id to note
    note.id = id;

    return note;
  }

  Future<void> pickImages() async {
    // prompt user to select multiple images from photo gallery
    final ({String? error, List<XFile>? imageFiles}) result = await ImagePickerService.pickImages();

    List<String> photoStrings = result.imageFiles != null ? await ImagePickerService.convertToString(result.imageFiles!) : [];

    // check if there was an error when selecting images from gallery
    if (result.error != null) {
      toastService.showSnackbar(result.error.toString());
      return;
    }

    debugPrint("result.imageFiles: ${result.imageFiles!.length}");

    if (_photoStrings.isNotEmpty) {
      _photoStrings.addAll(photoStrings);
    } else {
      // convert image files into string representations to be inserted into database
      _photoStrings = photoStrings;
    }

    // convert images files to image providers to be displayed in the UI
    final List<ImageProvider> imageProviders = ImagePickerService.toImageProvider(result.imageFiles ?? []);

    _imagesMap.addAll({for (var i = 0; i < photoStrings.length; i++) '${photoStrings[i]}-$i': imageProviders[i]});

    // set the state of the images that should be displayed in the UI
    setImages(imageProviders);
  }

  Future<void> _insertImages(int noteID) async {
    // convert list of image string to list of Photo object to be assigned to newly added note in memory
    _photos = [for (String imageString in _photoStrings) Photo(noteID: noteID, imageName: imageString)];

    // insert list of Photo objects into database returning list of Photo id's
    List<int> photoIds = await PhotoProvider.insert(_photos);

    // assign each Photo its respective unique id returned from database insertion
    _photos.forEachIndexed((index, Photo photo) => photo.id = photoIds[index]);

    debugPrint("Number of images added: ${_photos.length}");
  }

// TODO: Review and refactor where possible
  void removeImage(ImageProvider image) {
    String keyToRemove = '';

    for (var entry in _imagesMap.entries) {
      if (entry.value == image) {
        debugPrint("removeImage called!");
        keyToRemove = entry.key; // represents image name

        var imageToRemove = keyToRemove.split('-')[0];

        _images.remove(image);
        _photoStrings.removeWhere((imageName) => imageName == imageToRemove);

        debugPrint("${_photos.length}");
      }
    }

    _imagesMap.remove(keyToRemove);

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
}
