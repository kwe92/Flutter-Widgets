import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/custom_list_tile.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/download_controller.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/simulated_download_controller.dart';

class AnimatedDownloadButtonExample extends StatefulWidget {
  const AnimatedDownloadButtonExample({super.key});

  @override
  State<AnimatedDownloadButtonExample> createState() => _AnimatedDownloadButtonExampleState();
}

class _AnimatedDownloadButtonExampleState extends State<AnimatedDownloadButtonExample> {
  late final List<DownloadController> _downloadControllers;

  @override
  void initState() {
    super.initState();

    _downloadControllers = List<DownloadController>.generate(
      20,
      (int i) => SimulatedDownloadController(
        onOpenDownload: () => _onOpenDownload(i),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomerBuilder(builder: _buildAppBar),
        body: Builder(builder: _buildListItems),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(
        elevation: 3,
        backgroundColor: Colors.lightBlue,
        surfaceTintColor: Colors.lightBlue,
        shadowColor: Colors.black.withOpacity(0.4),
        title: const Text(
          "Animated Download Button",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      );

  Widget _buildListItems(BuildContext context) => ListView.separated(
        itemCount: _downloadControllers.length,
        itemBuilder: (BuildContext context, int i) => CustomListTile(
          controller: _downloadControllers[i],
          title: "App ${i + 1}",
        ),
        separatorBuilder: (context, index) => const Divider(),
      );

  void _onOpenDownload(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Opened App ${index + 1}"),
      ),
    );
  }
}

class CustomerBuilder extends Builder implements PreferredSizeWidget {
  const CustomerBuilder({
    required super.builder,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
