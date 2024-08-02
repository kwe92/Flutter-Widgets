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
        const SizedBox(height: 24.0),
        Text(
          title,
          style: const TextStyle(fontSize: 50.0),
        ),
        const SizedBox(height: 12.0),
        Image.asset(assetImagePath)
      ],
    );
  }
}
