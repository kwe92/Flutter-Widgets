import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/widgets/button_shape.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/constants.dart';

class DownloadButton extends StatelessWidget {
  final DownloadStatus status;

  final Duration transitionDuration;

  final double downloadProgress;

  final VoidCallback onDownload;

  final VoidCallback onCancel;

  final VoidCallback onOpen;

  const DownloadButton({
    required this.status,
    required this.onDownload,
    required this.onCancel,
    required this.onOpen,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.downloadProgress = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => switch (status) {
        DownloadStatus.notDownloaded => onDownload(),
        DownloadStatus.fetchingDownload => null,
        DownloadStatus.downloading => onCancel(),
        DownloadStatus.downloaded => onOpen(),
      },
      child: Stack(
        children: [
          ButtonShape(
            transitionDuration: transitionDuration,
            isDownloaded: _isDownloaded,
            isDownloading: _isDownloading,
            isFetching: _isFetching,
          ),
          // TODO: can be moved to a private method
          Positioned.fill(
            child: AnimatedOpacity(
              duration: transitionDuration,
              opacity: (_isDownloading || _isFetching) ? 1.0 : 0.0,
              curve: Curves.ease,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    value: _isFetching ? null : downloadProgress,
                    backgroundColor: _isDownloading ? CupertinoColors.lightBackgroundGray : Colors.white.withOpacity(0),
                    valueColor: AlwaysStoppedAnimation(
                      _isFetching ? CupertinoColors.lightBackgroundGray : CupertinoColors.activeBlue,
                    ),
                  ),
                  if (_isDownloading)
                    const Icon(
                      Icons.stop,
                      size: 14,
                      color: CupertinoColors.activeBlue,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool get _isDownloading => status == DownloadStatus.downloading;

  bool get _isFetching => status == DownloadStatus.fetchingDownload;

  bool get _isDownloaded => status == DownloadStatus.downloaded;
}
