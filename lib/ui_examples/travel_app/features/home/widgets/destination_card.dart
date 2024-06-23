import 'package:flutter/material.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/model/destination.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({required this.destination, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 310,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              destination.image,
            ).image),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    );
  }
}
