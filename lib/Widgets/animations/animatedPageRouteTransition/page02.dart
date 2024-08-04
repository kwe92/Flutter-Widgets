import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/animatedPageRouteTransition/shared/image_with_title.dart';

class Page02 extends StatelessWidget {
  const Page02({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff00b0ff),
          surfaceTintColor: const Color(0xff00b0ff),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Page 2",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        body: const ImageWithTitle(
          title: "Isekai",
          assetImagePath: "assets/isekai.jpeg",
        ),
      ),
    );
  }
}
