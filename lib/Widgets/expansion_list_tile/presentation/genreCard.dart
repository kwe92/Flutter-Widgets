import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/constants/layout.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    required this.image,
    required this.description,
    super.key,
  });

  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      margin: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 400,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(image, fit: BoxFit.fill),
            ),
          ),
          gapH8,
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description:',
                      style: TextStyle(
                          fontSize: Sizes.p26, fontFamily: Fonts.main),
                    ),
                    gapH8,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(Sizes.p16, 0, 0, 0),
                      child: Text(
                        description,
                        style: const TextStyle(
                            fontSize: Sizes.p26, fontFamily: Fonts.main),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
