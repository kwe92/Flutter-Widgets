import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/models/photo.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

// TODO: add notes

class ImagePickerService {
  ImagePickerService._();

  static Future<({List<XFile>? imageFiles, String? error})> pickImages() async {
    final ImagePickerPlatform picker = ImagePickerPlatform.instance;

    try {
      final List<XFile> pickedImageFile = await picker.getMultiImageWithOptions(
        // TODO: review image options
        options: const MultiImagePickerOptions(
          imageOptions: ImageOptions(
            imageQuality: 50,
            maxWidth: 150,
          ),
        ),
      );

      if (pickedImageFile.isEmpty) {
        return (imageFiles: <XFile>[], error: null);
      }

      return (imageFiles: pickedImageFile, error: null);
    } catch (error) {
      return (imageFiles: null, error: error.toString());
    }
  }

  static List<ImageProvider> toImageProvider(List<XFile> imageFiles) {
    final imageProviders = [for (var imageFile in imageFiles) FileImage(File(imageFile.path))];
    return imageProviders;
  }

  static Future<List<String>> convertToString(List<XFile> imageFiles) async {
    final images = [for (var imageFile in imageFiles) base64Encode(await imageFile.readAsBytes())];

    return images;
  }

  static List<ImageProvider> imageFromBase64String(List<Photo?> imageObjs) {
    final images = [
      for (Photo? photo in imageObjs)
        Image.memory(
          base64Decode(photo!.imageName),
          fit: BoxFit.fill,
        ).image
    ];

    return images;
  }

  static Map<String, ImageProvider> imageFromBase64StringAsMap(List<Photo?> imageObjs) {
    Map<String, ImageProvider> result = {};

    for (Photo? photo in imageObjs) {
      result.putIfAbsent(
          photo!.imageName,
          () => Image.memory(
                base64Decode(photo.imageName),
                fit: BoxFit.fill,
              ).image);
    }

    return result;
  }
}
