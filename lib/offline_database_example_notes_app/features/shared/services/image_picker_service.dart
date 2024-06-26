import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/models/photo.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

// TODO: add notes

class ImagePickerService {
  ImagePickerService._();

  // ({List<XFile> imageFiles, String error})

  static Future<(List<XFile> imageFiles, String error)> pickImages() async {
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
        return (<XFile>[], '');
      }

      return (pickedImageFile, '');
    } catch (error) {
      return (<XFile>[], error.toString());
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

    debugPrint("imageFromBase64StringAsMap imageObjs count: ${imageObjs.length}");

    for (var i = 0; i < imageObjs.length; i++) {
      result.addAll(
        {
          '${imageObjs[i]!.imageName}-$i': Image.memory(
            base64Decode(imageObjs[i]!.imageName),
            fit: BoxFit.fill,
          ).image,
        },
      );
    }

    return result;
  }
}
