import 'package:flutter/material.dart';

class WorkingWithPushNotifications extends StatelessWidget {
  const WorkingWithPushNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(),
          Text(""),
        ],
      ),
    );
  }
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

  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [],
      ),
    );
  }
}
