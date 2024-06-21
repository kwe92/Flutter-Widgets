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
              )
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
