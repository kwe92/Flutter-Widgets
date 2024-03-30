import 'package:awesome_notifications/awesome_notifications.dart';

final notificationService = NotificationService();

// Callback Functions
class NotificationService {
  final instance = AwesomeNotifications();

  final channelKey = "basic_channel";

  // detects new and and scheduled notification is created
  static Future<void> onNotifcationCreated(ReceivedNotification receivedNotification) async {
    // TODO: implement
  }

  static Future<void> onNotifcationDisplayed(ReceivedNotification receivedNotification) async {
    // TODO: implement
  }

  static Future<void> onNotifcationDismissed(ReceivedNotification receivedNotification) async {
    // TODO: implement
  }

  static Future<void> onNotifcationSelected(ReceivedNotification receivedNotification) async {
    // TODO: implement
  }
}
