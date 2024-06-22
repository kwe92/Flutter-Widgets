import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/widgets/detail_icon_listtile.dart';

class DetailIcons extends StatelessWidget {
  final String travelTime;
  final String temp;
  final double rating;
  const DetailIcons({
    required this.travelTime,
    required this.temp,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DetailIconListTile(
            icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/clock_icon.svg"),
            details: travelTime),
        DetailIconListTile(
          icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/cloud_icon.svg"),
          details: temp,
        ),
        DetailIconListTile(
          icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/star_icon.svg"),
          details: rating.toStringAsFixed(1),
        ),
      ],
    );
  }
}
