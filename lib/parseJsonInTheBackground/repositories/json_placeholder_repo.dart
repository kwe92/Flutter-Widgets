import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_widgets/parseJsonInTheBackground/model/photo.dart';
import 'package:flutter_widgets/parseJsonInTheBackground/services/json_placeholder_service.dart';

class JsonPlaceholderRepo extends ChangeNotifier {
  static final instance = JsonPlaceholderRepo._();

  List<Photo> _photos = [];

  List<Photo> get photos => _photos;

  JsonPlaceholderRepo._();

  Future<void> getPhotos() async {
    final response = await JsonPlaceholderService.instance.fetchPhotos();

    // alternate method for downcasting a list
    final result = (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();

    _photos = [for (var json in result) Photo.fromJson(json)];

    debugPrint('photo from photos list: ${_photos[0]}');

    notifyListeners();
  }
}
