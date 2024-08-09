import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/demo_app_icon.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/download_button.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/download_controller.dart';

// TODO: try using standard ListTile widget and compare differences

class CustomListTile extends StatelessWidget {
  final DownloadController controller;
  final String title;

  const CustomListTile({
    required this.title,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Row(
            children: [
              const DemoAppIcon(),
              const SizedBox(width: 16),
              Builder(builder: _buildListTileContent),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 120,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return DownloadButton(
                  status: controller.downloadStatus,
                  downloadProgress: controller.progress,
                  onDownload: controller.startDownload,
                  onCancel: controller.stopDownload,
                  onOpen: controller.openDownload,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTileContent(BuildContext context) => SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                height: 0,
                color: Color(0xff3a3a3a),
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "Lorem ipsum odor amet, consectetuer adipiscing elit",
              style: TextStyle(
                height: 0,
                color: Color(0xff8d8d8c),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
}
