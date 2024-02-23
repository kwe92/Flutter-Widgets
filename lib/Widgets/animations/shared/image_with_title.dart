import 'package:flutter/material.dart';

class ImageWithTitle extends StatelessWidget {
  final String title;

  final String assetImagePath;

  const ImageWithTitle({
    required this.title,
    required this.assetImagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 50.0),
        ),
        const SizedBox(height: 6.0),
        Image.asset(assetImagePath)
      ],
    );
  }
}
