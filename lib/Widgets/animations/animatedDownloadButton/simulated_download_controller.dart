import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/constants.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/download_controller.dart';

class SimulatedDownloadController extends DownloadController with ChangeNotifier {
  DownloadStatus _downloadStatus;

  double _progress;

  final VoidCallback _onOpenDownload;

  bool _isDownloading = false;

  @override
  DownloadStatus get downloadStatus => _downloadStatus;

  @override
  double get progress => _progress;

  SimulatedDownloadController({
    required VoidCallback onOpenDownload,
    DownloadStatus downloadStatus = DownloadStatus.notDownloaded,
    double progress = 0.0,
  })  : _downloadStatus = downloadStatus,
        _progress = progress,
        _onOpenDownload = onOpenDownload;

  @override
  void startDownload() {
    if (downloadStatus == DownloadStatus.notDownloaded) {
      _doSimulatedDownload();
    }
  }

  @override
  void stopDownload() {
    if (_isDownloading) {
      _isDownloading = false;
      _downloadStatus = DownloadStatus.notDownloaded;
      _progress = 0.0;
      notifyListeners();
    }
  }

  @override
  void openDownload() {
    if (downloadStatus == DownloadStatus.downloaded) {
      _onOpenDownload();
    }
  }

  Future<void> _doSimulatedDownload() async {
    // switch to fetching state
    _isDownloading = true;

    _downloadStatus = DownloadStatus.fetchingDownload;

    notifyListeners();

    // simulate fetch time
    await Future<void>.delayed(const Duration(seconds: 1));

    // stop simulation if user chose to cancel
    if (!_isDownloading) {
      return;
    }

    // switch to downloading state
    _downloadStatus = DownloadStatus.downloading;
    notifyListeners();

    // simulate varying download speeds
    const downloadProgressStops = [0.0, 0.15, 0.45, 0.7, 1.0];

    for (final stop in downloadProgressStops) {
      await Future<void>.delayed(const Duration(seconds: 1));

      // stop simulation if user chose to cancel
      if (!_isDownloading) {
        return;
      }

      _progress = stop;

      notifyListeners();
    }
    // simulate final delay
    await Future<void>.delayed(const Duration(seconds: 1));

    // stop simulation if user chose to cancel
    if (!_isDownloading) {
      return;
    }

    // switch to downloaded state, completing the simulation
    _downloadStatus = DownloadStatus.downloaded;

    _isDownloading = false;
    notifyListeners();
  }
}
