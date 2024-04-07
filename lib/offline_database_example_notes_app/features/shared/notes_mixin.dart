import 'package:flutter/material.dart';

/// Handle common functionality between adding a note and editing a note
mixin NotesMixin on ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  String _title = '';

  String _content = '';

  String get title => _title;

  String get content => _content;

  void setTitle(String value) {
    _title = value;
    debugPrint("title: $_title");
    notifyListeners();
  }

  void setContent(String value) {
    _content = value;
    debugPrint("content: $_content");
    notifyListeners();
  }
}
