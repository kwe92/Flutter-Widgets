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

// TODO: clean up editing images

//

class EditNoteViewModel extends ChangeNotifier with NotesMixin {
  late Note _note;

  Map<String, ImageProvider> _imagesMap = {};

  List<Photo> imagesToDelete = [];

  List<String> _updatedPhotoStrings = [];

  List<ImageProvider> _images = [];

  List<ImageProvider> _updatedImages = [];

  List<Photo> _photos = [];

  List<ImageProvider> get images => _images;

  EditNoteViewModel(Note note) {
    titleController.text = note.title;

    contentController.text = note.content;

    _note = note;

    _imagesMap = note.images.isNotEmpty ? ImagePickerService.imageFromBase64StringAsMap(note.images) : {};

    _images = _imagesMap.values.toList();

    setTitle(note.title);

    setContent(note.content);
  }

  Future<void> edit(Note prevNote) async {
    await _insertImages(_note.id!);

    final updatedNote = Note(
      id: prevNote.id,
      content: content,
      title: title,
      images: [..._note.images, ..._photos],
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

    for (var entry in _imagesMap.entries) {
      if (entry.value == image) {
        imageToRemove = entry.key;
        _note.images.removeWhere((photo) {
          bool result = photo!.imageName == entry.key;
          if (result) {
            imagesToDelete.add(photo);
          }
          return result;
        });
      }

      _images.remove(image);

      notifyListeners();
    }

    _imagesMap.remove(imageToRemove);

    print("removed images left: ${_note.images}");
    print("imagesToDelete: $imagesToDelete");

    notifyListeners();
  }

  Future<void> pickImages() async {
    final result = await ImagePickerService.pickImages();

    _updatedPhotoStrings = result.imageFiles != null ? await ImagePickerService.convertToString(result.imageFiles!) : [];

    setImages(ImagePickerService.toImageProvider(result.imageFiles ?? []));
  }

  void setImages(List<ImageProvider> images) {
    if (_images.isNotEmpty && (_images.length + images.length) <= 9 && (_images.length + images.length + _updatedImages.length) <= 9) {
      _images.addAll(images);

      notifyListeners();
      return;
    }

    if (_images.isEmpty) {
      print("_images.isEmpty: iamges added!");
      _images = images;
      notifyListeners();
      return;
    }

    toastService.showSnackbar("can only have up to 9 images per note.");

    debugPrint("setImages Called: $_images");
    notifyListeners();
  }

  Future<void> _insertImages(int noteID) async {
    _photos = [for (String imageString in _updatedPhotoStrings) Photo(noteID: noteID, imageName: imageString)];

    List<int> photoIds = await PhotoProvider.insert(_photos);

    _photos.forEachIndexed((index, Photo photo) => photo.id = photoIds[index]);
  }
}
