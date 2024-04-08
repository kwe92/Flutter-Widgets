import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
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
}
