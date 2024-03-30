import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/awesome_notifications/notificationService.dart';

class AwesomeNotificationExampleViewModel extends ChangeNotifier {
  final channelGroupKey = "basic_group_channel";

  AwesomeNotifications get notificationInstance => notificationService.instance;

  String get channelKey => notificationService.channelKey;

  AwesomeNotificationExampleViewModel() {
    initialize();
  }

// initialize awesome notifications
  Future<void> initialize() async {
    await notificationInstance.initialize(
      // default icon path, if null then will use a generic flutter icon
      null,
      // list of notification channels
      [
        // the values can be whatever you want them to be
        NotificationChannel(
          channelGroupKey: channelGroupKey,
          channelKey: channelKey,
          channelName: "basic_notifications",
          channelDescription: "basic notification channel",
        ),
      ],
      // group notifications
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: channelGroupKey,
          channelGroupName: "basic_group",
        ),
      ],
    );

    await checkNotificationPermissions();

    setNotificationListeners();
  }

  // check if notifications are allowed and if not then request to allow notifications
  Future<void> checkNotificationPermissions() async {
    bool isAllowedToSendNotification = await notificationInstance.isNotificationAllowed();

    if (!isAllowedToSendNotification) {
      notificationInstance.requestPermissionToSendNotifications();
    }
  }

  // listen to events and trigger callback functions
  // required to be static and to set at least one callback for the awesome package to work correctly
  void setNotificationListeners() {
    notificationInstance.setListeners(
      onActionReceivedMethod: NotificationService.onNotifcationSelected,
      onNotificationCreatedMethod: NotificationService.onNotifcationCreated,
      onDismissActionReceivedMethod: NotificationService.onNotifcationDismissed,
      onNotificationDisplayedMethod: NotificationService.onNotifcationDisplayed,
    );
  }
}
