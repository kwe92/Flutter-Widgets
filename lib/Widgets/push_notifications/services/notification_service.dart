import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  const NotificationService._();

  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id",
        "channel name",
        channelDescription: "channel description",
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(
        categoryIdentifier: "plainCategory",
      ),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );
}

class NofiService {
  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    const andriodInitialze = AndroidInitializationSettings("mipmap/ic_launcher");
    const iosInitialize = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: andriodInitialze,
      iOS: iosInitialize,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNotification({
    int id = 0,
    required String title,
    required String body,
    String? payload,
    required FlutterLocalNotificationsPlugin fln,
  }) async {
    const not = NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id",
        "channel name",
        channelDescription: "channel description",
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(
        categoryIdentifier: "plainCategory",
      ),
    );

    await fln.show(id, title, body, not);
  }
}
