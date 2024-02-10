import 'dart:io';

import 'http_service.dart';

abstract class ApiService with HttpService {
  @override
  Map<String, String> get headers => {
        HttpHeaders.contentTypeHeader: "application/json",
      };

  @override
  String get host => "https://zenquotes.io/api";
}

/// backend API endpoint paths.
enum Endpoint {
  randomQuotes50("/quotes");

  final String path;

  const Endpoint(this.path);
}
