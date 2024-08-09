import 'package:flutter/material.dart';

// TODO: refactor

Widget _buildDecoratedImage({required String image}) => Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: SizedBox(
          height: 200,
          child: Image.asset(image, fit: BoxFit.fill),
        ),
        //Image.asset(image),
      ),
    );

Widget _buildImageRow({required String img1, required String img2}) => Row(
      children: <Widget>[_buildDecoratedImage(image: img1), _buildDecoratedImage(image: img2)],
    );

Widget buildWidetColumn() => Container(
    decoration: const BoxDecoration(color: Colors.black26),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildImageRow(img1: 'assets/isekai.jpeg', img2: 'assets/sol.jpeg'),
        _buildImageRow(img1: 'assets/seinen.webp', img2: 'assets/harem.webp')
      ],
    ));

class WorkingWithContainer extends StatelessWidget {
  const WorkingWithContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildWidetColumn(),
      ),
    );
  }
}
