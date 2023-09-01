import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/Widgets/reusable_modal/modal_v2.dart';
import 'package:gap/gap.dart';

class WorkingWithPushNotifications extends StatelessWidget {
  const WorkingWithPushNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFd580),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Image(),
            const Gap(46),
            Header(
              "Local\nNotiications",
              type: 4,
            )
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 6,
        child: SvgPicture.asset(
          "assets/flutter-logo.svg",
          fit: BoxFit.contain,
        ),
      );
}

final List<CustomIconButton> _buttonList = [];

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData iconData;

  const CustomIconButton({
    required this.onTap,
    required this.title,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 60,
      child: Row(
        children: [
          Icon(iconData),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
