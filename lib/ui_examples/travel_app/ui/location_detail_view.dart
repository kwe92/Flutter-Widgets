// TODO: create the location detail view from: https://www.figma.com/design/MrzFHl3QryIQCLS3T2EekF/Mobile-app-UI-Template-(Community)?node-id=0-1&t=szPoBAM8LQmATeRZ-0

// TODO: ensure you can use relative path instead of absolute path for images
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                      child: InfoListTile(destination: "Andes Mountain", continent: "Soutth, America", price: 230),
                    ),
                  ],
                ),
              ),
              //? BOTTOM SECTION START
              const SizedBox(height: 24),
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
              const SizedBox(height: 24),
              const DetailIcons(
                // TODO: remove hard coded
                travelTime: "8 hours",
                temp: "16°C",
                rating: 4.5,
              ),
              const SizedBox(height: 24),
              // TODO: fix fade overflow not working
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
            ],
          ),
        ),
      ),
    );
  }
}

class CircularIconButtton extends StatelessWidget {
  final Widget icon;
  final Color? backbroundColor;

  const CircularIconButtton({
    required this.icon,
    this.backbroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: backbroundColor ?? const Color(0xff1D1D1D).withOpacity(0.40),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}

class InfoListTile extends StatelessWidget {
  final String destination;
  final String continent;
  final double price;

  const InfoListTile({
    required this.destination,
    required this.continent,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.maxFinite,
      height: 104,
      decoration: BoxDecoration(
        // TODO: use gradient color LinearGradient?
        color: const Color(0xff132c40),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 18, bottom: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/location_icon.svg",
                      width: 20,
                      height: 20,
                      color: const Color(0xffCAC8C8),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      continent,
                      style: const TextStyle(
                        color: Color(0xffCAC8C8),
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26, bottom: 16, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Price",
                  style: TextStyle(
                    color: Color(0xffCAC8C8),
                    fontSize: 14,
                  ),
                ),
                Text(
                  "\$${price.toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: Color(0xffCAC8C8),
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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

class DetailIconListTile extends StatelessWidget {
  final Widget icon;
  final String details;
  const DetailIconListTile({required this.icon, required this.details, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: const BoxDecoration(
            color: Color(0xffEDEDED),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Center(child: icon),
        ),
        const SizedBox(width: 6),
        Text(
          details,
          style: const TextStyle(
            color: Color(0xff7E7E7E),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

// ? Growable Container

//  ConstrainedBox(
//                 constraints: const BoxConstraints(
//                   minHeight: 100,
//                   maxHeight: 134,
//                   minWidth: double.infinity,
//                 ),
//                 child: const Padding(
//                   // padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),

//                   child: Text(
//                     "This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are also home to",
//                     overflow: TextOverflow.fade,
//                     style: TextStyle(
//                       color: Color(0xffA5A5A5),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
