import 'package:flutter/material.dart';

class WelcomeUserListTile extends StatelessWidget {
  const WelcomeUserListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Ade 👋🏿",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Explore the world",
              style: TextStyle(
                color: Color(0xff888888),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundImage: Image.asset(
              "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/profile_img00.avif",
            ).image,
          ),
        ),
      ],
    );
  }
}
