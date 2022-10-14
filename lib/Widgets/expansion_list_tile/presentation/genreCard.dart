import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GenreCard extends StatelessWidget {
  const GenreCard(
      {required this.genre,
      required this.image,
      required this.description,
      super.key});
  final String genre;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      elevation: 0.0,
      margin: const EdgeInsets.all(0),
      child: Column(
        children: [
          Text(genre),
          Image.asset(image),
          Text(description),
        ],
      ),
    );
  }
}
