import 'package:flutter/material.dart';

class CircleListItem extends StatelessWidget {
  final double size;
  const CircleListItem({this.size = 54, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.network(
          'https://docs.flutter.dev/cookbook'
          '/img-files/effects/split-check/Avatar1.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


// ClipOval

//    - the child takes the shape of a circle or an oval depending on the parent widgets dimensions

//    - used over ClipRRect when the parent is a circle or an oval