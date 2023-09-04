import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/Widgets/push_notifications/colors.dart';
import 'package:flutter_widgets/Widgets/push_notifications/services/notification_service.dart';
import 'package:flutter_widgets/Widgets/push_notifications/ui/widgets/custom_icon_button.dart';
import 'package:flutter_widgets/Widgets/reusable_modal/modal_v2.dart';
import 'package:flutter_widgets/main.dart';
import 'package:gap/gap.dart';

class WorkingWithPushNotifications extends StatelessWidget {
  const WorkingWithPushNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    const double paddingH = 24;
    return Scaffold(
      backgroundColor: PushNotificationAppColors.backgroundColor,
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
              "Local\nNotifications",
              style: textStyleHeader4.copyWith(
                color: PushNotificationAppColors.primary,
                fontSize: 52,
              ),
            ),
            const Gap(52),
            // TODO: change button colors
            CustomIconButton(
              onTap: () {
                print("pressed!`");
                NofiService.showNotification(
                  title: "title",
                  body: "body",
                  fln: flutterLocalNotificationsPlugin,
                );
                // NotificationService.showNotification(
                //   title: "First Notification!",
                //   body: "Congratulations king, you wrote your first notification!",
                //   payload: "kwe.aps",
                // );
              },
              isWhite: true,
              buttonColor: PushNotificationAppColors.primary,
              highlightColor: PushNotificationAppColors.secondary,
              text: "Sample Notification",
              iconData: Icons.notifications,
            ),
            const Gap(32),
            CustomIconButton(
              onTap: () {},
              isWhite: true,
              buttonColor: PushNotificationAppColors.primary,
              highlightColor: PushNotificationAppColors.secondary,
              text: "Schedule Notification",
              iconData: Icons.notifications_active,
            ),
            const Gap(32),
            CustomIconButton(
              onTap: () {},
              isWhite: true,
              buttonColor: PushNotificationAppColors.primary,
              highlightColor: PushNotificationAppColors.secondary,
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
