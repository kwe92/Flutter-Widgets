import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/awesome_notifications/AwesomeNotificationExampleViewModel.dart';
import 'package:provider/provider.dart';

class AwesomeNotificationExampleView extends StatelessWidget {
  const AwesomeNotificationExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AwesomeNotificationExampleViewModel(),
      builder: (context, _) {
        final model = context.watch<AwesomeNotificationExampleViewModel>();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Awesome Notifications"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // create a manual notification or create a notification from json data
              model.notificationInstance.createNotification(
                content: NotificationContent(
                  id: 1,
                  channelKey: model.channelKey,
                  title: "test notification",
                  body: "text notification content",
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
