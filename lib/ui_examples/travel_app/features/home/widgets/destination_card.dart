import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/location_detail_view.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/model/destination.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/widgets/circular_icon_button.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({required this.destination, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO: add a better transition
      onTap: () async => await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationDetailView(destination: destination),
        ),
      ),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircularIconButtton(
                  icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/heart_icon.svg")),
              DestinationInfoListTile(destination: destination)
            ],
          ),
        ),
      ),
    );
  }
}

class DestinationInfoListTile extends StatelessWidget {
  final Destination destination;

  const DestinationInfoListTile({required this.destination, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      width: double.maxFinite,
      height: 76,
      decoration: BoxDecoration(
        color: const Color(0xff132c40).withOpacity(0.6),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 3),
            spreadRadius: 2,
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            destination.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/location_icon.svg",
                    width: 12,
                    height: 12,
                    color: const Color(0xffCAC8C8),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    parseString(destination.continent),
                    style: const TextStyle(
                      color: Color(0xffCAC8C8),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 12,
                    height: 12,
                    child: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/outlined_star_icon.svg"),
                  ),
                  const SizedBox(width: 2),
                  Text(
                    destination.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Color(0xffCAC8C8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String parseString(String location) {
  final locationInfo = location.split(",");
  if (locationInfo[0].length > 5) {
    return locationInfo.last;
  }

  return location;
}
