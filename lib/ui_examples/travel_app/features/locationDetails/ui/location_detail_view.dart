// TODO: create the location detail view from: https://www.figma.com/design/MrzFHl3QryIQCLS3T2EekF/Mobile-app-UI-Template-(Community)?node-id=0-1&t=szPoBAM8LQmATeRZ-0

// TODO: ensure you can use relative path instead of absolute path for images

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/widgets/circular_icon_button.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/widgets/detail_icons.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/widgets/info_list_tile.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/widgets/custom_button.dart';

const placeHolderText =
    "This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are also home to";

class LocationDetailView extends StatelessWidget {
  const LocationDetailView({super.key});

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
                    image: Image.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/andes-mountain.png").image,
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
                            icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/back_icon.svg"),
                          ),
                          CircularIconButtton(
                            icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/tag_icon.svg"),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                      child: InfoListTile(
                        destination: "Andes Mountain",
                        continent: "Soutth, America",
                        price: 230,
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
              const DetailIcons(
                // TODO: remove hard coded
                travelTime: "8 hours",
                temp: "16°C",
                rating: 4.5,
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
                child: const Text(
                  placeHolderText,
                  maxLines: 4,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
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
