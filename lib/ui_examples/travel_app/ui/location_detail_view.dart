// TODO: create the location detail view from: https://www.figma.com/design/MrzFHl3QryIQCLS3T2EekF/Mobile-app-UI-Template-(Community)?node-id=0-1&t=szPoBAM8LQmATeRZ-0

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationDetailView extends StatelessWidget {
  const LocationDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: 460,
          margin: const EdgeInsets.only(
            left: 28,
            top: 28,
            right: 28,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(26),
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/andes-mountain.png").image,
            ),
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
        color: const Color(0xff132c40),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 5),
            blurRadius: 9,
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
