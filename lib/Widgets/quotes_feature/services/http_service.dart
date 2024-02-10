// ignore_for_file: unused_catch_stack

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final client = http.Client();

/// HttpService abstracts away commonly repeated API call details.
mixin HttpService {
  static final _httpSocketError =
      http.Response('{"socket_exception":"Unable to communicate with server. Check your internet connection."}', 550);

  String get host;

  Map<String, String> get headers;

  /// get Sends an HTTP GET request with the given headers to the given URL endpoint.
  Future<http.Response> get(
    String endpoint, {
    String? tempHost,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final http.Response response = await client.get(
        Uri.parse(tempHost ?? host + endpoint),
        headers: headers..addAll(extraHeaders ?? {}),
      );

      return ResponseHandler.parseStatusCode(response, host + endpoint);
    } catch (error, stackTrace) {
      debugPrint('Error:\n\n${error.toString()}');
      return _httpSocketError;
    }
  }

  /// post Sends an HTTP POST request with the given headers and body to the given URL.
  Future<http.Response> post(
    String endpoint, {
    required dynamic body,
    String? tempHost,
    Map<String, String>? baseHeaders,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final http.Response response = await client.post(
        Uri.parse(tempHost ?? host + endpoint),
        headers: headers..addAll(extraHeaders ?? {}),
        body: body,
      );
      return ResponseHandler.parseStatusCode(response, host + endpoint);
    } catch (error, stackTrace) {
      debugPrint("Error:\n\n${error.toString()}");
      return _httpSocketError;
    }
  }

  /// put sends an HTTP PUT request with the passed in headers and body to the given URI.
  Future<http.Response> put(
    String endpoint, {
    required dynamic body,
    String? tempHost,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final http.Response response = await client.put(
        Uri.parse(tempHost ?? host + endpoint),
        body: body,
        headers: headers..addAll(extraHeaders ?? {}),
      );
      return ResponseHandler.parseStatusCode(response, host + endpoint);
    } catch (error, stackTrace) {
      debugPrint("Error:\n\n${error.toString()}");
      return _httpSocketError;
    }
  }

  /// delete sends an HTTP DELETE request with the passed in headers to the specified URI.
  Future<http.Response> delete(
    String endpoint, {
    dynamic body,
    String? tempHost,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final response = await client.delete(
        Uri.parse(host + endpoint),
        headers: headers..addAll(extraHeaders ?? {}),
      );

      return ResponseHandler.parseStatusCode(response, host + endpoint);
    } catch (error, stackTrace) {
      debugPrint("Error:\n\n${error.toString()}");
      return _httpSocketError;
    }
  }
}

/// Handles response by parsing the endpoint, status code, and response body from the Response object.
/// Retrieves error messages from response if the status code is not 200 or 201.
class ResponseHandler {
  ResponseHandler._();

  /// Checks status code of response, If status code is 200 or 201 returns true else false.

  static bool checkStatusCode(http.Response response) {
    return (response.statusCode == 200 || response.statusCode == 201) ? true : false;
  }

  /// Decodes json string and return first error
  static String getErrorMsg(String jsonString) {
    final Map<String, dynamic> parsedJson = jsonDecode(jsonString);
    return parsedJson.values.toList()[0];
  }

  /// Logs endpoint, response status code and server response body.
  static http.Response parseStatusCode(http.Response response, String endpoint) {
    debugPrint('\nEndpoint: \n$endpoint');
    debugPrint('\nStatus Code:\n${response.statusCode}');
    debugPrint('\nResponse Body:\n${utf8.decode(response.bodyBytes)}');

    return response;
  }
}




// What is a Service?

//   - Services aslo referred to as repositories request responses from
//     server endpoints
//   - the response is then decoded and servered throughout your application
//   - Services can also be used to serve temporary data throughtout your application
//     like a ToastService that displays temporary snack bars and banners
