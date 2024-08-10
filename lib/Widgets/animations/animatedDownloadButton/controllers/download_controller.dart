import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/constants.dart';

abstract class DownloadController implements ChangeNotifier {
  DownloadStatus get downloadStatus;

  double get progress;

  void startDownload();

  void stopDownload();

  void openDownload();
}
