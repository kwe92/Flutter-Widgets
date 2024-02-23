import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/shared/image_with_title.dart';

class Page02 extends StatelessWidget {
  const Page02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Page 2"),
      ),
      body: const ImageWithTitle(
        title: "Isekai",
        assetImagePath: "assets/isekai.jpeg",
      ),
    );
  }
}
