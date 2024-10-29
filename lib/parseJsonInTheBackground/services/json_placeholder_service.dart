import 'package:flutter/foundation.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/services/api_service.dart';
import 'package:http/http.dart' as http;

//!! TODO: access photos from: https://jsonplaceholder.typicode.com/photos and test how long it takes to parse json in Dart Foundation Course

class JsonPlaceholderService extends ApiService {
  static final instance = JsonPlaceholderService._();

  JsonPlaceholderService._() {
    debugPrint('JsonPlaceholderService created');
  }

  @override
  String get host => 'https://jsonplaceholder.typicode.com/';

  Future<http.Response> fetchPhotos() async {
    final response = await get(JsonPlaceholderEndPoint.photos.path);

    if (response.statusCode == 200) {
      return response;
    }

    throw 'Error: Status Not Okay:\n\nStatus Code: ${response.statusCode}\n\nresponse body: ${response.body}';
  }
}

enum JsonPlaceholderEndPoint {
  photos('photos');

  final String path;

  const JsonPlaceholderEndPoint(this.path);
}
