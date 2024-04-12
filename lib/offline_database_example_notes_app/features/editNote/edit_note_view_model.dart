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

class EditNoteViewModel extends ChangeNotifier with NotesMixin {
  late Note _note;

  Map<String, ImageProvider> _imagesMap = {};

  List<Photo?> _imagesToDelete = [];

  List<String> _updatedPhotoStrings = [];

  List<ImageProvider> _images = [];

  List<Photo> _photos = [];

  List<ImageProvider> get images => _images;

  EditNoteViewModel(Note note) {
    initialize(note);
  }

  void initialize(Note note) {
    titleController.text = note.title;

    contentController.text = note.content;

    _note = note;

    _imagesMap = note.images.isNotEmpty ? ImagePickerService.imageFromBase64StringAsMap(note.images) : {};

    _images = _imagesMap.values.toList();

    setTitle(note.title);

    setContent(note.content);
  }

  Future<void> edit(Note prevNote) async {
    removeImages();

    // insert newly added images into the database
    await _insertImages(prevNote.id!);

    final updatedNote = Note(
      id: prevNote.id,
      title: title,
      content: content,
      images: [..._note.images, ..._photos],
      createdAt: prevNote.createdAt,
      updatedAt: DateTime.now(),
    );

    // update note in database
    await NotesProvider.edit(updatedNote);

    // delete images marked for deletion from the database
    await PhotoProvider.deleteMulti(_imagesToDelete);

    notesService.replaceNote(updatedNote, prevNote);

    clearInput();

    debugPrint("Note edited successfully!");

    notifyListeners();
  }

  void clearInput() {
    setTitle('');
    setContent('');

    titleController.clear();

    contentController.clear();
  }

  // TODO: clean up implementation

  void markImageForDeletion(ImageProvider image) {
    var imageToRemove;
    var updatedImageToRemove;
    var keyToRemove;

    for (var entry in _imagesMap.entries) {
      if (entry.value == image) {
        keyToRemove = entry.key;
        imageToRemove = keyToRemove.split('-')[0];

        Photo? imageMarkedForRemoval = _note.images.firstWhere(
          (photo) => photo?.imageName == imageToRemove,
          orElse: () => Photo(noteID: 0, imageName: ''),
        );

        _imagesToDelete.add(imageMarkedForRemoval);
      }

      for (var imageName in _updatedPhotoStrings) {
        if (entry.key == imageName && imageName != imageToRemove) {
          updatedImageToRemove = imageName;
        }
      }
    }

    _imagesMap.remove(keyToRemove);

    _images.remove(image);

    _updatedPhotoStrings.remove(updatedImageToRemove);

    debugPrint("images marked for deletion: $_imagesToDelete");

    notifyListeners();
  }

  void removeImages() {
    for (var i = 0; i < _imagesToDelete.length; i++) {
      _note.images.removeWhere((photo) => photo?.id == _imagesToDelete[i]?.id);
    }
    notifyListeners();
  }

  Future<void> pickImages() async {
    final result = await ImagePickerService.pickImages();

    List<String> updatedPhotoStrings = result.imageFiles != null ? await ImagePickerService.convertToString(result.imageFiles!) : [];

    if (_updatedPhotoStrings.isNotEmpty) {
      _updatedPhotoStrings.addAll(updatedPhotoStrings);
    } else {
      // convert image files into string representations to be inserted into database
      _updatedPhotoStrings = result.imageFiles != null ? await ImagePickerService.convertToString(result.imageFiles!) : [];
    }

    final imageProviders = ImagePickerService.toImageProvider(result.imageFiles ?? []);

    final providerMap = {for (var i = 0; i < updatedPhotoStrings.length; i++) _updatedPhotoStrings[i]: imageProviders[i]};

    _imagesMap.addAll(providerMap);

    setImages(imageProviders);
  }

  void setImages(List<ImageProvider> images) {
    if (_images.isEmpty || (_images.length + images.length) <= 9) {
      _images.addAll(images);

      notifyListeners();
      return;
    }

    toastService.showSnackbar("can only have up to 9 images per note.");

    notifyListeners();
  }

  Future<void> _insertImages(int noteID) async {
    _photos = [for (String imageString in _updatedPhotoStrings) Photo(noteID: noteID, imageName: imageString)];

    List<int> photoIds = await PhotoProvider.insert(_photos);

    _photos.forEachIndexed((index, Photo photo) => photo.id = photoIds[index]);
  }
}
