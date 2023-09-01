import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/Widgets/push_notifications/ui/widgets/custom_icon_button.dart';
import 'package:flutter_widgets/Widgets/reusable_modal/modal_v2.dart';
import 'package:gap/gap.dart';

class WorkingWithPushNotifications extends StatelessWidget {
  const WorkingWithPushNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    const double paddingH = 24;
    return Scaffold(
      backgroundColor: const Color(0xFFFFd580),
      body: Padding(
        padding: EdgeInsets.only(
          left: paddingH,
          top: MediaQuery.of(context).size.height / 10,
          right: paddingH,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Image(),
            const Gap(52),
            Text(
              "Local\nNotiications",
              style: textStyleHeader4.copyWith(fontSize: 52),
            ),
            const Gap(52),
            CustomIconButton(
              onTap: () {},
              text: "Sample Notification",
              iconData: Icons.notifications,
            ),
            const Gap(32),
            CustomIconButton(
              onTap: () {},
              text: "Schedule Notification",
              iconData: Icons.notifications_active,
            ),
            const Gap(32),
            CustomIconButton(
              onTap: () {},
              text: "Remove Notifications",
              iconData: Icons.delete_forever,
            ),
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
