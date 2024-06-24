// TODO: ensure you can use relative path instead of absolute path for images

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDescription/ui/location_description_view.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/model/destination.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/widgets/circular_icon_button.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/widgets/detail_icons.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/widgets/info_list_tile.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/widgets/custom_button.dart';

class LocationDetailView extends StatelessWidget {
  final Destination destination;
  const LocationDetailView({
    required this.destination,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            top: 24,
            right: 24,
          ),
          child: Column(
            children: [
              Container(
                height: 420,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(26),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.asset(destination.image).image,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      color: Colors.black.withOpacity(0.20),
                      spreadRadius: 3,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 18,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularIconButtton(
                            onTap: () => Navigator.pop(context),
                            icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/back_icon.svg"),
                          ),
                          CircularIconButtton(
                            icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/tag_icon.svg"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                      child: InfoListTile(
                        destination: destination.name,
                        continent: parseString(destination.continent),
                        price: destination.price,
                      ),
                    ),
                  ],
                ),
              ),
              //? BOTTOM SECTION START
              const SizedBox(height: 18),
              Row(
                children: [
                  const Text(
                    "Overview",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 32),
                  Text(
                    "Details",
                    style: TextStyle(
                      color: const Color(0xff1B1B1B).withOpacity(0.62),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              DetailIcons(
                travelTime: "${destination.flightDuration} hours",
                temp: "${destination.temperature}°C",
                rating: destination.rating,
              ),
              const SizedBox(height: 18),
              // TODO: ShaderMask Review
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                  Colors.black54,
                  Colors.white,
                ]).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: GestureDetector(
                  onTap: () async => await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocationDescriptionView(destination: destination)),
                  ),
                  child: Text(
                    destination.description,
                    maxLines: 4,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              CustomButton(
                label: "Book Now",
                iconRight: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/send_icon.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO: colud refactor to keep D.R.Y
String parseString(String location) {
  final locationInfo = location.split(",");
  if (locationInfo[0].length > 8) {
    return locationInfo.last;
  }

  return location;
}
