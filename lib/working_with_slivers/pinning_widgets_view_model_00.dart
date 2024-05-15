// ignore_for_file:  prefer_final_fields

import 'package:flutter/material.dart';

class PinningWidgets00ViewModel extends ChangeNotifier {
  double _headerSectionSize = 150;

  Offset? offset;

  Size? size;

  GlobalKey globalKey = GlobalKey();

  double get headerSectionSize => _headerSectionSize;

  void setHeaderSectionSize(double headerSectionSize) {
    _headerSectionSize = headerSectionSize;
    notifyListeners();
  }

  calculateSizeAndPosition() {
    // final renderBox = globalKey.currentContext!.findRenderObject() as RenderSliver;

    // offset = renderBox.localToGlobal(Offset.zero);
    // size = renderBox.size;

    // notifyListeners();

    // print(offset);

    // _isCallBackExecuted = true;
  }
}
