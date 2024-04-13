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
  int _imageCounter = 0;

  List<Photo> _photos = [];

  List<String> _photoStrings = [];

  Map<String, ImageProvider> _imagesMap = {};

  List<ImageProvider> _images = [];

  List<ImageProvider> get images => _images;

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
    // instantiate new Note object
    final note = Note(
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );

    // insert note into database and retrieve unique id
    final int id = await NotesProvider.insert(note);

    // insert images into database
    await _insertImages(id);

    // assign unique id to note
    note.id = id;

    return note;
  }

  Future<void> pickImages() async {
    // prompt user to select images

    var (List<XFile> imageFiles, String error) = await ImagePickerService.pickImages();

    // check for error
    if (error.isNotEmpty) {
      toastService.showSnackbar(error.toString());
      return;
    }

    // retrieve image providers to be displayed in the UI
    final List<ImageProvider> imageProviders = ImagePickerService.toImageProvider(imageFiles);

    if ((_images.length + imageProviders.length) <= 9) {
      // retrieve image String representations to be inserted into database
      List<String> photoStrings = await ImagePickerService.convertToString(imageFiles);

      _photoStrings.addAll(photoStrings);

      _imagesMap.addAll(
        {
          for (int i = 0; i < photoStrings.length; i++) '${photoStrings[i]}-$_imageCounter': imageProviders[i],
        },
      );

      _imageCounter++;

      _images.addAll(imageProviders);

      notifyListeners();
      return;
    }

    toastService.showSnackbar("images are limited to 9 per note.");
  }

  Future<void> _insertImages(int noteID) async {
    _photos = [for (String imageString in _photoStrings) Photo(noteID: noteID, imageName: imageString)];

    // insert Photo objects into database returning list of Photo id's
    List<int> photoIds = await PhotoProvider.insert(_photos);

    // assign each Photo it's respective unique id
    _photos.forEachIndexed((int index, Photo photo) => photo.id = photoIds[index]);

    debugPrint("Number of images added: ${_photos.length}");
  }

  void removeImage(ImageProvider image) {
    _imagesMap.removeWhere(_removeImage(image));

    notifyListeners();
  }

  bool Function(String, ImageProvider) _removeImage(ImageProvider image) {
    return (key, imageProvider) {
      final isMatchingImages = imageProvider == image;

      if (isMatchingImages) {
        String keyToRemove = key; // represents image name

        String imageToRemove = keyToRemove.split('-')[0];

        _images.remove(image);

        _photoStrings.remove(imageToRemove);

        debugPrint("image deleted!");
      }

      return isMatchingImages;
    };
  }

  void cearVariables() {
    _imageCounter = 0;
    setTitle('');
    setContent('');
    _photos = [];
    _photoStrings = [];
    _images = [];
    _imagesMap = {};
    titleController.clear();
    contentController.clear();
    notifyListeners();
  }
}

  // void removeImage(ImageProvider image) {
  //   String keyToRemove = '';

  //   for (var entry in _imagesMap.entries) {
  //     if (entry.value == image) {
  //       debugPrint("removeImage called!");
  //       keyToRemove = entry.key; // represents image name

  //       var imageToRemove = keyToRemove.split('-')[0];

  //       _images.remove(image);
  //       _photoStrings.removeWhere((imageName) => imageName == imageToRemove);

  //       debugPrint("${_photos.length}");
  //     }
  //   }

  //   _imagesMap.remove(keyToRemove);

  //   notifyListeners();
  // }


